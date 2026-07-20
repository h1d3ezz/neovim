---@module 'lazy'
---@type LazySpec
return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    modes = {
      lsp = {
        win = { position = 'right' },
      },
    },
  },
  keys = {
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Toggle Error Panel (Trouble)' },
  },
}
