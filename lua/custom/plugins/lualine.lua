---@module 'lazy'
---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'catppuccin',
    },
    extensions = { 'quickfix' },
  },
}
