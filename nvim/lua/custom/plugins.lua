local plugins = {
    {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "gopls",
        },
      },
    },

    {
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
        require "custom.configs.lspconfig"
      end,
    },

--- divisa do que funciona
--     {
--     "mfussenegger/nvim-dap",
--     config = function()
--       require("core.utils").load_mappings("dap")
--     end
--   },

--   {
--     "dreamsofcode-io/nvim-dap-go",
--     ft = "go",
--     dependencies = "mfussenegger/nvim-dap",
--     config = function(_, opts)
--       require("dap-go").setup(opts)
--       require("core.utils").load_mappings("dap_go")
--     end
--   },



    -- {
    --   "olexsmir/gopher.nvim",
    --   ft = "go",
    --   config = function(_, opts)
    --     require("gopher").setup(opts)
    --     require("core.utils").load_mappings("gopher")
    --   end,
    --   build = function()
    --     vim.cmd [[silent! GoInstallDeps]]
    --   end,
    -- },
  }
  return plugins