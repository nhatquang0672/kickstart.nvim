-- Telekasten: Zettelkasten / note taking with Telescope
-- https://github.com/renerocksai/telekasten.nvim

vim.g.calendar_no_mappings = 1

vim.pack.add {
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/renerocksai/calendar-vim',
  'https://github.com/renerocksai/telekasten.nvim',
}

local home = vim.fn.expand '$HOME/works/self/projects/zettelkasten'

local telekasten = require 'telekasten'

telekasten.setup {
  home = home,
  dailies = home .. '/dailies',
  templates = home .. '/templates',
  template_new_note = home .. '/templates/basenote.md',
  template_new_daily = home .. '/templates/daily.md',
  new_note_filename = 'uuid-title',
  filename_space_subst = '-',
  auto_set_filetype = false,
}

vim.keymap.set('n', '<leader>zf', telekasten.find_notes, { desc = 'Find notes' })
vim.keymap.set('n', '<leader>zd', telekasten.find_daily_notes, { desc = 'Find daily notes' })
vim.keymap.set('n', '<leader>zg', telekasten.search_notes, { desc = 'Search notes' })
vim.keymap.set('n', '<leader>zz', telekasten.follow_link, { desc = 'Follow link' })
vim.keymap.set('n', '<leader>zT', telekasten.goto_today, { desc = 'Go to today' })
vim.keymap.set('n', '<leader>zW', telekasten.goto_thisweek, { desc = 'Go to this week' })
vim.keymap.set('n', '<leader>zw', telekasten.find_weekly_notes, { desc = 'Find weekly notes' })
vim.keymap.set('n', '<leader>zn', telekasten.new_note, { desc = 'New note' })
vim.keymap.set('n', '<leader>zN', telekasten.new_templated_note, { desc = 'New templated note' })
vim.keymap.set('n', '<leader>zy', telekasten.yank_notelink, { desc = 'Yank note link' })
vim.keymap.set('n', '<leader>zc', telekasten.show_calendar, { desc = 'Show calendar' })
vim.keymap.set('n', '<leader>zC', '<Cmd>CalendarT<CR>', { desc = 'Open calendar' })
vim.keymap.set('n', '<leader>zi', telekasten.paste_img_and_link, { desc = 'Paste image and link' })
vim.keymap.set('n', '<leader>zt', telekasten.toggle_todo, { desc = 'Toggle todo' })
vim.keymap.set('v', '<leader>zt', function() telekasten.toggle_todo { v = true } end, { desc = 'Toggle todo (visual)' })
vim.keymap.set('n', '<leader>zb', telekasten.show_backlinks, { desc = 'Show backlinks' })
vim.keymap.set('n', '<leader>zF', telekasten.find_friends, { desc = 'Find friends' })
vim.keymap.set('n', '<leader>zI', function() telekasten.insert_img_link { i = true } end, { desc = 'Insert image link' })
vim.keymap.set('n', '<leader>zp', telekasten.preview_img, { desc = 'Preview image' })
vim.keymap.set('n', '<leader>zm', telekasten.browse_media, { desc = 'Browse media' })
vim.keymap.set('n', '<leader>#', telekasten.show_tags, { desc = 'Show tags' })
