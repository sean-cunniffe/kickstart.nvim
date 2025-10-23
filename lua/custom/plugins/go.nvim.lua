return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {

      -- lsp_keymaps = false,
      -- other options
    },
    config = function()
      require('go').setup {
        gofmt = 'goimports', -- run goimports instead of gofmt
        max_line_len = 120, -- for golines
        -- tag_transform = false,
        -- lsp_cfg = true,
        lsp_gofumpt = true, -- if you want to use gofumpt
        lsp_on_attach = true,
        lsp_keymaps = false, -- you can set to true if you want default keymaps
      }

      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          local fmt = require 'go.format'
          fmt.gofmt()
        end,
      })
    end,
    -- config = function(lp, opts)
    --   require('go').setup {
    --     gofmt = 'gofumpt',
    --     lsp_gofumpt = true,
    --   }
    --   -- require('go').setup(opts)
    --   local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
    --   vim.api.nvim_create_autocmd('BufWritePre', {
    --     pattern = '*.go',
    --     callback = function()
    --       require('go.format').goimports()
    --     end,
    --     group = format_sync_grp,
    --   })
    -- end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
