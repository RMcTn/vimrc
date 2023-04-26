local builtin = require('telescope.builtin')
vim.keymap.set('n', '<CR>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-n>', builtin.live_grep, {})
vim.keymap.set('n', '<C-l>', builtin.buffers, {})
--- TODO(reece): Make the visuals of telescope bigger/wider
--- TODO(reece): Want to include hidden files in the find_file call
