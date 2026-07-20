---@module 'lazy'
---@type LazySpec
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    on_attach = function(bufnr)
      local api = require 'nvim-tree.api'
      api.map.on_attach.default(bufnr)
      vim.keymap.set('n', 'S', api.node.run.system, { buffer = bufnr, desc = 'Run System' })
    end,
  },
  keys = {
    { '\\', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle Nvim Tree' },
    { '<leader>\\', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'Toggle into currently opened file' },
  },
}
