local set = vim.keymap.set

-- yank to clipboard as well
set("n", "y", '"+y', { noremap = true, silent = true })
set("v", "y", '"+y', { noremap = true, silent = true })

set("n", "<leader>Y", "<cmd> %y <CR>", { noremap = true, silent = true })
set("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
set("x", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })
set("n", "<Esc>", "<cmd> noh <CR>", { noremap = true, silent = true })
-- set("n", "<leader>to", function()
-- 	vim.opt.scrolloff = 999 - vim.o.scrolloff
-- end)

-- navigate in insert mode
set("i", "<C-h>", "<Left>", { noremap = true, silent = true })
set("i", "<C-l>", "<Right>", { noremap = true, silent = true })
set("i", "<C-j>", "<Down>", { noremap = true, silent = true })
set("i", "<C-k>", "<Up>", { noremap = true, silent = true })

-- navigate through splits
set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

set("n", "<C-e>", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true })
set("i", "<C-e>", function()
	vim.diagnostic.open_float()
end, { noremap = true, silent = true })
set("i", "<C-s>", function()
	vim.lsp.buf.signature_help()
end, { noremap = true, silent = true })



set("v", "<leader>ca", function()
	vim.lsp.buf.code_action()
end, { noremap = true, silent = true })

vim.api.nvim_set_keymap("x", "<leader>qw", 'c""<Esc>P', { noremap = true, silent = true })

set("n", "<C-b>", "<ESC>^i", { noremap = true, silent = true }) -- Beginning of line
set("n", "<C-m>", "<End>", { noremap = true, silent = true }) -- End of line
set("n", "<C-s>", "<cmd> w <CR>", { noremap = true, silent = true }) -- Save file
set("n", "<leader>q", "<cmd> q! <CR>", { noremap = true, silent = true }) -- Force quit

set("n", "<leader>gl", function()
	local line = tonumber(vim.fn.input("Go to line: "))
	if line then
		vim.cmd(tostring(line))
	end
end, { noremap = true, silent = true }) -- Go to line number

-- set("n", "<leader>nn", "<cmd> set nu! <CR>", { noremap = true, silent = true }) -- Toggle line number
-- set("n", "<leader>rn", "<cmd> set rnu! <CR>", { noremap = true, silent = true }) -- Toggle relative number
set("n", "<leader>b", "<cmd> enew <CR>", { noremap = true, silent = true }) -- New buffer

set("n", "<leader>fd", function()
	require("telescope").extensions.file_browser.file_browser({
		path = "%:p:h",
		select_buffer = true,
		hidden = true,
		grouped = true,
		display_stat = false,
		sorting_strategy = "ascending",
		layout_strategy = "horizontal", -- chave para flutuar no meio
		layout_config = { prompt_position = "top", preview_width = 0.6 },
	})
end, { noremap = true, silent = true }) -- File browser com suporte a criação

--set("n", "<Tab>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true }) -- próximo buffer
--set("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true }) -- buffer anterior
--set("n", "<leader>x", "<Cmd>BufferClose<CR>", { noremap = true, silent = true }) -- fechar buffer atual
--set("n", "<C-p>", "<Cmd>BufferPick<CR>", { noremap = true, silent = true }) -- escolher buffer pelo número

-- folding (ocultar e mostrar blocos de código)
set("n", "<leader>zc", "zc", { noremap = true, silent = true }) -- Fecha um bloco
set("n", "<leader>zo", "zo", { noremap = true, silent = true }) -- Abre um bloco
set("n", "<leader>zM", "zM", { noremap = true, silent = true }) -- Fecha todos os blocos
set("n", "<leader>zR", "zR", { noremap = true, silent = true }) -- Abre todos os blocos

-- abrir terminal em split horizontal abaixo
set("n", "<leader>ftt", ":belowright 8split | terminal<CR>", { noremap = true, silent = true }) -- terminal embaixo
-- sair do modo terminal para o modo normal usando <Esc>
set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true }) -- sair do modo terminal

set("i", "<C-Right>", "<C-o>w", { noremap = true, silent = true })
set("i", "<C-Left>", "<C-o>b", { noremap = true, silent = true })


