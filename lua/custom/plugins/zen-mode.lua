-- Zen Mode: distraction-free coding
-- https://github.com/folke/zen-mode.nvim

vim.pack.add { 'https://github.com/folke/zen-mode.nvim' }

require('zen-mode').setup {}

vim.keymap.set('n', '<leader>tz', function() require('zen-mode').toggle() end, { desc = '[T]oggle [Z]en mode' })
