return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    options = {
      theme = 'auto',
    },
    config = function()
      require('lualine').setup {
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            { 'diff', colored = true }, -- git diff added here
            { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = 'E:', warn = 'W:' } },
          },
          lualine_c = { { 'filename', path = 1 } },
        },
      }
    end,
  },
}
