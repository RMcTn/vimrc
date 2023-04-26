local telescope = require("telescope")
local telescopeConfig = require("telescope.config")
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<CR>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-n>', builtin.live_grep, {})
vim.keymap.set('n', '<C-l>', builtin.buffers, {})
--- TODO(reece): Make the visuals of telescope bigger/wider

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

table.insert(vimgrep_arguments, "--hidden")

telescope.setup({
	defaults = {
		-- `hidden = true` is not supported in text grep commands.
		vimgrep_arguments = vimgrep_arguments,
		layout_config = {
			width = 0.9
		}
	},
	pickers = {
		find_files = {
			-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
			find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
		},
	},
})

