---@module 'lazy'
---@type LazySpec
return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then return end
          return 'make install_jsregexp'
        end)(),
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
          require('luasnip.loaders.from_vscode').lazy_load()
          require('luasnip.loaders.from_snipmate').lazy_load {
            paths = { vim.fn.stdpath 'config' .. '/snippets' },
          }
        end,
      },
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'default',
        ['<CR>'] = { 'select_and_accept', 'fallback' },
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        menu = { auto_show = true },
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
        accept = {
          auto_brackets = { enabled = true },
        },
      },

      cmdline = {
        enabled = true,
        keymap = { preset = 'cmdline' },
        completion = {
          menu = { auto_show = true },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets' },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      signature = { enabled = true },
    },
  },
}
