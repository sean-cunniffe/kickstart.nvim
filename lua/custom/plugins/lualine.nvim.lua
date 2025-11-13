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
          lualine_x = {
            function()
              -- try to show the pending key sequence (showcmd)
              return vim.fn.getcmdline() ~= '' and vim.fn.getcmdline() or ''
            end,
            {
              function()
                local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }
                if next(buf_clients) == nil then
                  return ''
                end
                local names = {}
                for _, client in pairs(buf_clients) do
                  table.insert(names, ' ' .. client.name)
                end
                return table.concat(names, ' ')
              end,
              color = { fg = '#7aa2f7', gui = 'bold' },
            },
            'fileformat',
            'filetype',
          },
        },
      }
    end,
  },
}
