return {
  {
    'SmiteshP/nvim-navic',
    dependencies = 'neovim/nvim-lspconfig',
    config = function()
      local navic = require 'nvim-navic'
      navic.setup {
        highlight = true, -- enable highlights
        separator = ' > ', -- breadcrumb separator
        depth_limit = 5, -- how deep to show nested symbols
        icons = {
          File = ' ',
          Module = ' ',
          Namespace = ' ',
          Package = ' ',
          Class = ' ',
          Method = ' ',
          Property = ' ',
          Field = ' ',
          Constructor = ' ',
          Enum = ' ',
          Interface = ' ',
          Function = ' ',
          Variable = ' ',
          Constant = ' ',
          String = ' ',
          Number = ' ',
          Boolean = ' ',
          Array = ' ',
          Object = ' ',
          Key = ' ',
          Null = ' ',
          EnumMember = ' ',
          Struct = ' ',
          Event = ' ',
          Operator = ' ',
          TypeParameter = ' ',
        },
      }

      -- require('lualine').setup {
      --   sections = {
      --     lualine_c = {
      --       { require('nvim-navic').get_location, cond = require('nvim-navic').is_available },
      --     },
      --   },
      -- }
    end,
  },
}
