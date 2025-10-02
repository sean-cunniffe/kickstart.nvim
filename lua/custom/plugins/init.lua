-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'ellisonleao/gruvbox.nvim',
  },
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    config = function()
      require('kanagawa').setup {
        compile = true,
        theme = 'wave',
        -- transparent = true,
        overrides = function(colors)
          local theme = colors.theme
          return {
            Visual = {
              bg = theme.syn.keyword,
              fg = theme.ui.bg,
            },
            LineNr = { fg = colors.palette.crystalBlue },
            CursorLineNr = { fg = colors.palette.peachRed, bold = true },
          }
        end,
        background = {
          dark = 'wave',
          light = 'lotus',
        },
      }
      vim.cmd 'KanagawaCompile'
      vim.cmd 'colorscheme kanagawa'
    end,
  },
}
