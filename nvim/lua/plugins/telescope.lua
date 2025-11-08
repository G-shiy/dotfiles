return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = function()
      local builtin = require("telescope.builtin")
      local fb = require("telescope").extensions.file_browser

      return {
        { "<leader>ff", builtin.find_files, desc = "Find File" },
        {
          "<s-t>",
          function() builtin.diagnostics({ wrap_results = true }) end,
          desc = "Diagnostics"
        },
        { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
        { "<leader>fw", builtin.live_grep, desc = "Find with Grep" },
        { "<leader>fh", builtin.help_tags, desc = "Find Help" },
        {
          "<C-O>",
          function()
            fb.file_browser({
              path = vim.fn.expand("%:p:h"),
              select_buffer = true,
              hidden = true,
              grouped = true,
              respect_gitignore = false,
              previewer = true,
              layout_config = { prompt_position = "top" }
            })
          end,
          desc = "File Browser"
        }
      }
    end,
    opts = function()
      local fb_actions = require("telescope._extensions.file_browser.actions")
      return {
        defaults = {
          vimgrep_arguments = {
            "rg", "-L", "--color=never", "--no-heading",
            "--with-filename", "--line-number", "--column", "--smart-case"
          },
          previewer = true,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            grouped = true,
            hidden = true,
            respect_gitignore = false,
            mappings = {
                ["n"] = {
                ["a"] = fb_actions.create,
                ["d"] = fb_actions.remove,
                ["r"] = fb_actions.rename, -- <-- esta linha aqui
                },
                ["i"] = {
                ["<C-a>"] = fb_actions.create,
                ["<C-d>"] = fb_actions.remove,
                ["<C-r>"] = fb_actions.rename, -- <-- e esta
                }

            }
          }
        },
        extensions_list = { "file_browser" }
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    }
  }
}
