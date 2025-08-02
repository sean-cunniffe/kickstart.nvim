return {
  {
    'MattesGroeger/vim-bookmarks',
  },
  {
    'tom-anders/telescope-vim-bookmarks.nvim',
    config = function()
      vim.keymap.set('n', 'ma', function()
        require('telescope').extensions.vim_bookmarks.all {
          layout_strategy = 'vertical',
          layout_config = {
            height = 0.85,
            width = 0.6,
          },
          previewer = true,
        }
      end, { desc = ':Telescope vim_bookmarks all<CR>' })

      -- vim.keymap.set('n', 'ma', ':Telescope vim_bookmarks all<CR>', { noremap = true, silent = true, desc = 'Telescope vim_bookmarks all' })
    end,
  },
}
