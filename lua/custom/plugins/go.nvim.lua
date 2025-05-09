-- shortcut for creating saving a test file
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  callback = function()
    vim.keymap.set('n', '<leader>cgt', function()
      local filepath = vim.fn.expand '%:p'
      local dirname = vim.fn.expand '%:p:h'
      local filename = vim.fn.expand '%:t:r'

      -- Don't try to make a test for a test
      if filename:match '_test$' then
        print 'Already in a test file.'
        return
      end

      local test_file = dirname .. '/' .. filename .. '_test.go'

      if vim.fn.filereadable(test_file) == 0 then
        -- File doesn't exist, create it
        vim.cmd('edit ' .. test_file)
        vim.cmd 'write' -- Save right away to create the file on disk
        vim.cmd('normal! opackage ' .. vim.fn.expand '%:p:h:t') -- Insert package line
        print('Created new test file: ' .. test_file)
      else
        vim.cmd('edit ' .. test_file)
      end
    end, { buffer = true, desc = 'Go to or create test file' })
  end,
})
return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional packages
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('go').setup()
    end,
    event = { 'CmdlineEnter' },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
