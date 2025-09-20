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
          adapter = 'ollama',
          render = { format = 'markdown' },
        },
        inline = { adapter = 'ollama' },
      },
      opts = { log_level = 'DEBUG' },
    },
  },
}
