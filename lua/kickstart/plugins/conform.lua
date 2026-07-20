---@module 'lazy'
---@type LazySpec
return {
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format { async = true } end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Specify filetypes to format on save here
        local enabled_filetypes = {
          lua = true,
          python = true,
          cpp = true,
          html = true,
          css = true,
        }
        if enabled_filetypes[vim.bo[bufnr].filetype] then
          return { timeout_ms = 500 }
        else
          return nil
        end
      end,
      default_format_opts = {
        lsp_format = 'fallback',
      },
      -- Specify external formatters here
      formatters_by_ft = {
        cpp = { 'clang-format' },
        c = { 'clang-format' },
      },
    },
  },
}
