-- manages vim session by git branch
return {
  {
    'olimorris/persisted.nvim',
    lazy = false,
    opts = {
      autoload = true,
      autosave = true,
      use_git_branch = true,
    },
    config = function(_, opts)
      local persisted = require 'persisted'
      persisted.branch = function()
        local branch = vim.fn.systemlist('git branch --show-current')[1]
        return vim.v.shell_error == 0 and branch or nil
      end
      persisted.setup(opts)
    end,
  },
  require('telescope').setup {
    extensions = {
      persisted = {
        layout_config = { width = 0.40, height = 0.25 },
      },
    },
  },
}
