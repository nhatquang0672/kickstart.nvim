-- Render Markdown: render markdown in-buffer using treesitter
-- https://github.com/MeanderingProgrammer/render-markdown.nvim

vim.pack.add {
  'https://github.com/nvim-treesitter/nvim-treesitter',
  'https://github.com/MeanderingProgrammer/render-markdown.nvim',
}

require('render-markdown').setup {
  file_types = { 'markdown' },
}

vim.keymap.set('n', '<leader>tm', '<Cmd>RenderMarkdown buf_toggle<CR>', { desc = '[T]oggle [M]arkdown rendering' })
