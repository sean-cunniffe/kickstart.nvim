return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Replaces dap-ui
    'igorlfs/nvim-dap-view',

    -- Still required for managing adapters
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Go debugger integration
    'leoluz/nvim-dap-go',
  },
  keys = {
    -- Basic debugging keymaps
    {
      '<F5>',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<F1>',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<F2>',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<F3>',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>b',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>B',
      function()
        require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Conditional Breakpoint',
    },

    -- Toggle DAP view (instead of dap-ui)
    {
      '<F7>',
      function()
        require('dap-view').toggle()
      end,
      desc = 'Debug: Toggle DAP view',
    },
  },

  config = function()
    local dap = require 'dap'
    local dap_view = require 'dap-view'

    -- Automatically install debuggers via Mason
    require('mason-nvim-dap').setup {
      automatic_installation = true,
      handlers = {},
      ensure_installed = { 'delve' },
    }

    -- Auto-open/close the DAP view on session start/stop
    dap.listeners.after.event_initialized['dapview_config'] = function()
      dap_view.open()
    end
    dap.listeners.before.event_terminated['dapview_config'] = function()
      dap_view.close()
    end
    dap.listeners.before.event_exited['dapview_config'] = function()
      dap_view.close()
    end

    -- Go-specific debugging setup
    require('dap-go').setup {
      delve = { detached = vim.fn.has 'win32' == 0 },
    }

    -- Optional: custom icons for breakpoints (kept same as before)
    local breakpoint_icons = vim.g.have_nerd_font
        and { Breakpoint = '', BreakpointCondition = '', BreakpointRejected = '', LogPoint = '', Stopped = '' }
      or { Breakpoint = '●', BreakpointCondition = '⊜', BreakpointRejected = '⊘', LogPoint = '◆', Stopped = '⭔' }

    vim.api.nvim_set_hl(0, 'DapBreak', { fg = '#e51400' })
    vim.api.nvim_set_hl(0, 'DapStop', { fg = '#ffcc00' })
    for type, icon in pairs(breakpoint_icons) do
      local tp = 'Dap' .. type
      local hl = (type == 'Stopped') and 'DapStop' or 'DapBreak'
      vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
