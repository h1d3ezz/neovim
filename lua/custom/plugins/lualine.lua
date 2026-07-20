---@module 'lazy'
---@type LazySpec
return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    extensions = { 'fzf', 'lazy', 'mason', 'nvim-dap-ui', 'nvim-tree', 'trouble' },
  },
}
