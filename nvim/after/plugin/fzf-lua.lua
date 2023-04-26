local fzf = require("fzf-lua")
vim.keymap.set('n', '<CR>', fzf.files, {})
vim.keymap.set('n', '<C-n>', fzf.live_grep, {})
vim.keymap.set('n', '<C-l>', fzf.buffers, {})

-- TODO(reece): Make it look like the fzf we config in vimrc
