return {
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      {
        'fredrikaverpil/neotest-golang',
        version = '*', -- Optional, but recommended
      },
    },
    config = function()
      local config = {
        runner = 'gotestsum', -- Optional, but recommended
      }
      -- Make sure neotest is required
      local neotest = require 'neotest'
      neotest.setup {
        adapters = {
          require 'neotest-golang'(config),
        },
      }
      -- Key mappings
      vim.keymap.set('n', '<leader>tt', function()
        neotest.run.run()
      end, { desc = 'Test: run nearest test' })

      vim.keymap.set('n', '<leader>tf', function()
        neotest.run.run(vim.fn.expand '%')
      end, { desc = 'Test: run all tests in current file' })

      vim.keymap.set('n', '<leader>td', function()
        neotest.run.run { strategy = 'dap' }
      end, { desc = 'Test: debug nearest test' })

      vim.keymap.set('n', '<leader>ts', function()
        neotest.run.stop()
      end, { desc = 'Test: stop running test(s)' })

      vim.keymap.set('n', '<leader>ta', function()
        neotest.run.attach()
      end, { desc = 'Test: attach to nearest running test' })

      vim.keymap.set('n', '<leader>to', function()
        neotest.output.open { enter = true } -- or maybe output_panel or output_window
      end, { desc = 'Test: open output of test' })

      vim.keymap.set('n', '<leader>tp', function()
        neotest.summary.toggle()
      end, { desc = 'Test: toggle summary window' })

      vim.keymap.set('n', '<leader>tw', function()
        neotest.watch.watch()
      end, { desc = 'Test: watch tests (rerun on file change)' })

      vim.keymap.set('n', '<leader>tq', function()
        neotest.summary.run_last() -- or maybe quit summary
      end, { desc = 'Test: run last test' })
    end,
  },
}
