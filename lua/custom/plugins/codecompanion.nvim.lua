return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      strategies = {
        chat = {
          adapter = 'copilot',
          render = { format = 'markdown' },
        },
        inline = { adapter = 'copilot' },
      },
      opts = { log_level = 'DEBUG' },
    },
  },
}
