---@module 'lazy'
---@type LazySpec
return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  opts = {
    flavour = 'mocha',
    integrations = {
      lualine = {
        all = function(colors)
          local C = colors
          local transparent_bg = C.none
          return {
            normal = {
              a = { bg = C.blue, fg = C.mantle, gui = 'bold' },
              b = { bg = C.surface0, fg = C.blue },
              c = { bg = transparent_bg, fg = C.text },
            },
            insert = {
              a = { bg = C.green, fg = C.base, gui = 'bold' },
              b = { bg = C.surface0, fg = C.green },
            },
            terminal = {
              a = { bg = C.green, fg = C.base, gui = 'bold' },
              b = { bg = C.surface0, fg = C.green },
            },
            command = {
              a = { bg = C.peach, fg = C.base, gui = 'bold' },
              b = { bg = C.surface0, fg = C.peach },
            },
            visual = {
              a = { bg = C.mauve, fg = C.base, gui = 'bold' },
              b = { bg = C.surface0, fg = C.mauve },
            },
            replace = {
              a = { bg = C.red, fg = C.base, gui = 'bold' },
              b = { bg = C.surface0, fg = C.red },
            },
            inactive = {
              a = { bg = transparent_bg, fg = C.blue },
              b = { bg = transparent_bg, fg = C.surface1, gui = 'bold' },
              c = { bg = transparent_bg, fg = C.overlay0 },
            },
          }
        end,
      },
    },
  },
}
