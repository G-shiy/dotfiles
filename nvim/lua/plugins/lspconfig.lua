local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = { vim.api.nvim_buf_get_name(0) },
  }
  vim.lsp.buf.execute_command(params)
end

local map = vim.keymap.set

local function apply(curr, win)
  local newName = vim.trim(vim.fn.getline("."))
  vim.api.nvim_win_close(win, true)

  if #newName > 0 and newName ~= curr then
    local params = vim.lsp.util.make_position_params()
    params.newName = newName

    vim.lsp.buf_request(0, "textDocument/rename", params)
  end
end

local function rename()
  local currName = vim.fn.expand("<cword>") .. " "

  local win = require("plenary.popup").create(currName, {
    title = "Renamer",
    style = "minimal",
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    relative = "cursor",
    borderhighlight = "RenamerBorder",
    titlehighlight = "RenamerTitle",
    focusable = true,
    width = 25,
    height = 1,
    line = "cursor+2",
    col = "cursor-1",
  })

  vim.cmd("normal A")
  vim.cmd("startinsert")

  map({ "i", "n" }, "<Esc>", "<cmd>q<CR>", { buffer = 0 })

  map({ "i", "n" }, "<CR>", function()
    apply(currName, win)
    vim.cmd.stopinsert()
  end, { buffer = 0 })
end

_G.Rename = {
  rename = rename,
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "williamboman/mason.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    keys = {
      { "gD", vim.lsp.buf.declaration, desc = "LSP Declaration" },
      { "gd", vim.lsp.buf.definition, desc = "LSP Definition" },
      { "K", vim.lsp.buf.hover, desc = "LSP Hover" },
      { "gi", require("telescope.builtin").lsp_implementations, desc = "LSP Implementation" },
      { "<leader>lsa", vim.lsp.buf.code_action, desc = "LSP Code Action" },
      { "gr", require("telescope.builtin").lsp_references, desc = "LSP References" },
      { "<leader>lsr", "<cmd>lua Rename.rename()<CR>", desc = "LSP Rename" },
      {
        "<leader>h",
        function()
          local enabled = vim.lsp.inlay_hint.is_enabled()
          if enabled then
                vim.notify("Não é possível desabilitar inlay hints nesta versão", vim.log.levels.WARN)
          else
            vim.lsp.inlay_hint.enable()
          end
        end,
        desc = "Toggle Inlay Hints",
      },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
      local util = require("lspconfig/util")

      -- Lua LSP
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
              disable = { "different-requires" },
            },
          },
        },
      })

      -- Python LSP (Pyright)
      lspconfig.pyright.setup({
        capabilities = capabilities, -- se você já definiu via cmp_nvim_lsp ou algo similar
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_dir = util.root_pattern(
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          ".git"
        ),
        settings = {
          python = {
            analysis = {
              pythonVersion = "3.13",
              typeCheckingMode = "basic", -- pode trocar pra "strict"
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              diagnosticMode = "workspace", -- analisa o projeto inteiro
            },
          },
        },
      })


      -- Go LSP (gopls)
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          env = {
            GOEXPERIMENT = "rangefunc",
          },
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
              ST1020 = false,
              ST1000 = false,
              useany = true,
              packagecomment = false,
            },
            staticcheck = true,
          },
          lintOnSave = "workspace",
          vetOnSave = "workspace",
          buildOnSave = "workspace",
        },
      })



      -- HTML LSP
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      -- Tailwind CSS LSP
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = { "templ", "astro", "javascript", "typescript", "react", "typescriptreact" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              templ = "html",
            },
          },
        },
      })

-- Clangd (C/C++/Objective-C)
lspconfig.clangd.setup({
  capabilities = capabilities,
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "hpp" },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
    "--suggest-missing-includes",
    "--pch-storage=memory",
    "--cross-file-rename",
    "--offset-encoding=utf-16",
  },
  init_options = {
    clangdFileStatus = true,
    usePlaceholders = true,
    completeUnimported = true,
  },
})
            lspconfig.jdtls.setup({
  capabilities = capabilities,
  cmd = {
    "jdtls",                             -- binário instalado pelo Mason ou no PATH
    "-data", vim.fn.stdpath("cache") .. "/jdtls-workspace/" ..
            vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")  -- workspace único por projeto
  },
  root_dir = util.root_pattern("pom.xml", "build.gradle", ".git"),
  settings = {
    java = {
      signatureHelp = { enabled = true },
      completion = { favoriteStaticMembers = { "org.junit.Assert.*", "org.mockito.Mockito.*" } },
      contentProvider = { preferred = "fernflower" },
      sources = {
        organizeImports = {
          starThreshold = 9999,
          staticStarThreshold = 9999,
        },
      },
      codeGeneration = {
        toString = { template = "${object.className}{${member.name()}=${member.value}, }" },
        hashCodeEquals = { useJava7Objects = true },
        useBlocks = true,
      },
    },
  },
})

      -- Lua templ (templ files)
      lspconfig.templ.setup({
        capabilities = capabilities,
        filetypes = { "templ" },
      })

      -- PHP (intelephense)
      lspconfig.intelephense.setup({
        capabilities = capabilities,
        filetypes = { "php" },
      })

      -- Protobuf
      lspconfig.protols.setup({
        capabilities = capabilities,
        filetypes = { "proto" },
      })
    end,
  },
}
