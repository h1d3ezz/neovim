---@module 'lazy'
---@type LazySpec
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'lewis6991/gitsigns.nvim',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    highlight_inactive_file_icons = true,
    sidebar_filetypes = {
      NvimTree = true,
    },
  },
}
