-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'ellisonleao/gruvbox.nvim',
  },
  {
    'onsails/lspkind.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = true,
        theme = 'wave',
        background = {
          dark = 'wave',
          light = 'lotus',
        },
        --   overrides = function(colors)
        --     local theme = colors.theme
        --
        --     return {
        --       -- Example: Make `Visual` selection more vivid
        --       Visual = { bg = theme.syn.keyword, fg = theme.ui.bg },
        --
        --       -- Example: Make `CursorLine` more visible
        --       CursorLine = { bg = theme.ui.bg_p1 },
        --
        --       -- Example: Make `Search` highlight bright yellow
        --       Search = { fg = theme.ui.bg, bg = theme.syn.constant },
        --
        --       -- Add more highlight overrides as you like
        --     }
        --   end,
      }
      vim.cmd 'KanagawaCompile'
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
