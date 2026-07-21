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
        preset = 'enter',
      },

      appearance = {
        nerd_font_variant = 'mono',
      },

      completion = {
        list = { selection = { preselect = false } },
        menu = {
          auto_show = function()
            local disabled = {
              markdown = true,
              text = true,
            }
            return not disabled[vim.bo.filetype]
          end,
        },
        documentation = { auto_show = true },
        ghost_text = { enabled = false },
        accept = {
          auto_brackets = { enabled = true },
        },
      },

      cmdline = {
        enabled = true,
        keymap = {
          preset = 'inherit',
          ['<Tab>'] = { 'accept' },
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
        completion = {
          menu = {
            auto_show = function() return vim.fn.getcmdtype() == ':' end,
          },
          ghost_text = { enabled = false },
        },
      },

      sources = {
        default = { 'lsp', 'path', 'buffer', 'snippets' },
        providers = {
          cmdline = {
            min_keyword_length = function(ctx)
              if ctx.mode == 'cmdline' and string.find(ctx.line, ' ') == nil then return 3 end
              return 0
            end,
          },
        },
      },

      snippets = { preset = 'luasnip' },

      fuzzy = { implementation = 'prefer_rust_with_warning' },

      signature = { enabled = true },
    },
  },
}
