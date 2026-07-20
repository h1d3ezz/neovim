---@module 'lazy'
---@type LazySpec
return {
  {
    'nvim-mini/mini.nvim',
    config = function()
      require('mini.ai').setup {
        mappings = {
          around_next = 'an',
          inside_next = 'in',
        },
        n_lines = 500,
      }
      require('mini.surround').setup()
      require('mini.starter').setup {
        version = false,
      }
    end,
  },
}
