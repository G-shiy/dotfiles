return {
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local devicons = require("nvim-web-devicons")

            require("lualine").setup({
                options = {
                    theme = "rose-pine",
                    component_separators = "",
                    icons_enabled = true,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = {
                        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                        { "filename", file_status = true, path = 0, padding = { left = 0, right = 0 } },
                    },
                    lualine_x = {
                        {
                            function() return "  " end,
                            color = { fg = "#FFD700" },
                            padding = { left = 0, right = 0 },
                        },
                    },
                    lualine_y = { "progress", "location" },
                    lualine_z = { { 'datetime', style = '%Hh:%Mm' },  },
                },
            })
        end,
    },
}
