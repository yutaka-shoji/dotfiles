return {
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
      vim.api.nvim_set_keymap('n', '<C-_>', 'gcc', {})
      vim.api.nvim_set_keymap('v', '<C-_>', 'gc', {})
    end,
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = true,
  },
}
