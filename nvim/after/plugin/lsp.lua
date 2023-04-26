local lsp = require("lsp-zero")

lsp.preset("recommended")


lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls',
	'rust_analyzer',
	'ruby_ls',
	'clangd',
	'gopls',
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<CR>'] = cmp.mapping.confirm({ select = true }),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.on_attach(function(client, bufnr) 
	local opts = {buffer = bufnr, remap = false}

	--- TODO(reece): 
		-- nmap <leader>qf  <Plug>(coc-fix-current)
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
	vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "gy", function() vim.lsp.buf.type_definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<c-j>", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "<c-k>", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup()
