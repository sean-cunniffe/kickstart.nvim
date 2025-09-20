-- Set barbar.nvim keybindings under <leader>b
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move to previous/next buffer
keymap('n', '<Tab>', '<Cmd>BufferNext<CR>', opts)
keymap('n', '<S-Tab>', '<Cmd>BufferPrevious<CR>', opts)

-- Re-order buffers
keymap('n', '<leader>b<', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<leader>b>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
keymap('n', '<leader>b1', '<Cmd>BufferGoto 1<CR>', opts)
keymap('n', '<leader>b2', '<Cmd>BufferGoto 2<CR>', opts)
keymap('n', '<leader>b3', '<Cmd>BufferGoto 3<CR>', opts)
keymap('n', '<leader>b4', '<Cmd>BufferGoto 4<CR>', opts)
keymap('n', '<leader>b5', '<Cmd>BufferGoto 5<CR>', opts)
keymap('n', '<leader>b6', '<Cmd>BufferGoto 6<CR>', opts)
keymap('n', '<leader>b7', '<Cmd>BufferGoto 7<CR>', opts)
keymap('n', '<leader>b8', '<Cmd>BufferGoto 8<CR>', opts)
keymap('n', '<leader>b9', '<Cmd>BufferGoto 9<CR>', opts)
keymap('n', '<leader>b0', '<Cmd>BufferLast<CR>', opts)

-- Close buffer
keymap('n', '<leader>bc', '<Cmd>BufferClose<CR>', opts)

-- Close all buffers except the current one
keymap('n', '<leader>bo', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- Pick a buffer to focus
keymap('n', '<leader>bb', '<Cmd>BufferPick<CR>', opts)

-- Sort buffers by various criteria
keymap('n', '<leader>bsd', '<Cmd>BufferOrderByDirectory<CR>', opts)
keymap('n', '<leader>bsl', '<Cmd>BufferOrderByLanguage<CR>', opts)
return {

  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
      vim.g.barbar_auto_setup = false
    end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
  },
}
