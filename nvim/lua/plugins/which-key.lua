return {
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            colors = true,
        },
        config = function(_, opts)
            local wk = require("which-key")
            wk.setup(opts)

            -- Grupos principais
            wk.add({
        { "<leader>b", group = "buffer" },
        { "<leader>ca", group = "code action" },
        { "<leader>d", group = "debug" },
        { "<leader>dad", group = "database" },
        { "<leader>f", group = "find" },
        { "<leader>ft", group = "terminal"},
        { "<leader>g", group = "git" },
        { "<leader>gf", group = "go fill" },
        { "<leader>gs", group = "go struct tags" },
        { "<leader>h", group = "hints", icon={icon="", color="yellow"}},
        { "<leader>lz", group = "lazygit/docker", icon = { icon = "", color = "blue" } },
        { "<leader>ls", group = "lsp",icon = { icon = "", color = "grey" } },
        { "<leader>l", group = "tools", icon = { icon = "", color = "green" } },
        { "<leader>n", group = "number" },
        { "<leader>q", group = "quit" },
        { "<leader>r", group = "rename/rust"},
        { "<leader>rc", group = "rust/crates" },
        { "<leader>x", group = "close buffer" },
        { "<leader>z", group = "folding", icon = { icon = "", color = "purple" } },
        
      })

      -- Comandos individuais
      wk.add({
        { "<leader>ff", desc = "Find File" },
        { "<leader>fb", desc = "Find Buffer" },
        { "<leader>fw", desc = "Find with Grep" },
        { "<leader>fh", desc = "Find Help" },
        { "<leader>fd", desc = "File Browser", icon= { icon = "", color = "blue" }},

        { "<leader>gvo", desc = "Diffview Open" },
        { "<leader>gvc", desc = "Diffview Close" },
        { "<leader>grh", desc = "Git Reset Hard" },
        { "<leader>gaa", desc = "Git Add All" },
        { "<leader>gp", desc = "Git Push" },
        { "<leader>gc", desc = "Git Commit" },
        { "<leader>gu", desc = "Git Push Upstream" },

        { "<leader>db", desc = "Toggle Breakpoint" },
        { "<leader>dc", desc = "Continue Debug" },
        { "<leader>ds", desc = "Step Into" },
        { "<leader>do", desc = "Step Out" },
        { "<leader>dn", desc = "Step Over" },
        { "<leader>dh", desc = "Terminate Debug" },
        { "<leader>dus", desc = "Debug Sidebar" },
        { "<leader>dw", desc = "Clear Breakpoints" },
        { "<leader>dt", desc = "Toggle DAP UI" },
        { "<leader>dr", desc = "Reset DAP UI" },
        { "<leader>dT", desc = "Toggle Types in DAP UI" },

        { "<leader>fto", desc = "Open Floating Terminal" },
        { "<leader>ftt", desc = "Open Horizontal Terminal" },

        { "<leader>lzg", desc = "Open LazyGit", icon={icon="", color="#ffffff"}},
        { "<leader>lzd", desc = "Open LazyDocker", icon="" },

        { "<leader>rcu", desc = "Update Crates" },
        { "<leader>re", desc = "Rust Expand Macro" },

        { "<leader>gsj", desc = "Add JSON Tags" },
        { "<leader>gsy", desc = "Add YAML Tags" },
        { "<leader>gfs", desc = "Go Fill Struct" },

        { "<leader>n", desc = "Toggle Line Number" },
        { "<leader>rn", desc = "Toggle Relative Number" },

        { "<leader>b", desc = "New Buffer" },
        { "<leader>x", desc = "Close Buffer", icon = { icon = "", color = "red" } },


        { "<leader>q", desc = "Force Quit" },

        { "<leader>lsa", desc = "LSP Code Action" },
        { "<leader>lsr", desc = "LSP Rename" },

        { "<leader>dad", desc = "DB UI Toggle" },

        { "<leader>zc", desc = "Fold Close" },
        { "<leader>zo", desc = "Fold Open" },
        { "<leader>zM", desc = "Fold Close All" },
        { "<leader>zR", desc = "Fold Open All" },
      })
        end,
    },
}
