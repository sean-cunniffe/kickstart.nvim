return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-lualine/lualine.nvim',
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', 'mm', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', 'ma', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set('n', '<S-Tab>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<Tab>', function()
        harpoon:list():next()
      end)

      local function harpoon_index()
        local buf_name = vim.fn.expand '%:p'
        for i, item in ipairs(harpoon:list().items) do
          if vim.loop.fs_realpath(item.value) == vim.loop.fs_realpath(buf_name) then
            return '󱡅 ' .. i
          end
        end
        return ''
      end

      require('lualine').setup {
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch' }, -- usually git branch
          lualine_c = {
            { 'filename', path = 1 }, -- filename with relative path
            { 'diff', colored = true }, -- git diff added here
            { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = 'E:', warn = 'W:' } },
          },
          lualine_x = { harpoon_index },
          lualine_y = { 'filetype' },
        },
      }
    end,
  },
}
