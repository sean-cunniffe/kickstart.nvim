return {
  {
    'A7Lavinraj/fyler.nvim',
    dependencies = { 'nvim-mini/mini.icons' },
    branch = 'stable',
    opts = {
      mappings = {},
    },
    config = function()
      vim.keymap.set('n', '\\', '<cmd>Fyler kind=float<CR>')
      require('fyler').setup {
        mappings = {
          ['\\'] = 'CloseView',
          ['<Esc>'] = 'CloseView',
        },
      }
    end,
  },
}
