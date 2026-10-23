-- Noice: replaces the UI for messages, cmdline and popupmenu
-- https://github.com/folke/noice.nvim

vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/rcarriga/nvim-notify',
  'https://github.com/folke/noice.nvim',
}

local muted = false

require('noice').setup {
  routes = {
    {
      filter = {
        cond = function() return muted end,
        any = { { event = 'notify' }, { event = 'msg_show' } },
        ['not'] = { any = { { error = true }, { find = '^Notifications ' } } },
      },
      opts = { skip = true },
    },
  },
}

vim.keymap.set('n', '<leader>tn', function()
  muted = not muted
  vim.notify('Notifications ' .. (muted and 'muted' or 'unmuted'))
end, { desc = '[T]oggle [N]otifications' })
vim.keymap.set('n', '<leader>nd', '<Cmd>Noice dismiss<CR>', { desc = '[N]oice [D]ismiss' })
vim.keymap.set('n', '<leader>nh', '<Cmd>Noice history<CR>', { desc = '[N]oice [H]istory' })
