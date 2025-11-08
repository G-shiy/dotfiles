local cmp = require("cmp")
local luasnip = require("luasnip")

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<S-Tab>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = { "s:n", "i:n" },
	callback = function()
		if luasnip.session.current_nodes[vim.api.nvim_get_current_buf()] then
			luasnip.unlink_current()
		end
	end,
})

return {
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	--[[ 	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "crates" },
		{ name = "vim-dadbod-completion" },
	}, ]]

	sources = {
		{ name = "copilot" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "nvim_lua" },
		{ name = "crates" },
		{ name = "vim-dadbod-completion" },
		{ name = "buffer" },
	},
	mapping = {
		["<C-j>"] = cmp.mapping.select_prev_item(),
		["<C-k>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),


		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<C-j>"] = cmp.mapping(function()
		-- 	if luasnip.jumpable(1) then
		-- 		luasnip.jump(1)
		-- 	end
		-- end, { "i", "s" }),
		-- ["<C-k>"] = cmp.mapping(function()
		-- 	if luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	end
		-- end, { "i", "s" }),
	},
}
