---@module 'lazy'
---@type LazySpec
return {
  'mfussenegger/nvim-lint',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local lint = require 'lint'
    lint.linters_by_ft = {
      markdown = { 'markdownlint' },
      cpp = { 'cppcheck' },
      python = { 'ruff' },
    }

    lint.linters.cppcheck.args = {
      '--enable=warning,style,performance,information',
      '--language=c++',
      '--inline-suppr',
      '--quiet',
      '--template={file}:{line}:{column}:{severity}:{id}:{message}',
    }

    lint.linters.cppcheck.parser = require('lint.parser').from_pattern(
      '(.+):(%d+):(%d+):(%a+):([%a]+):([^\r]+)',
      { 'file', 'lnum', 'col', 'severity', 'code', 'message' },
      {
        error = vim.diagnostic.severity.ERROR,
        warning = vim.diagnostic.severity.WARN,
        style = vim.diagnostic.severity.INFO,
        performance = vim.diagnostic.severity.INFO,
        information = vim.diagnostic.severity.HINT,
        portability = vim.diagnostic.severity.INFO,
      }
    )
    local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
      group = lint_augroup,
      callback = function()
        if vim.bo.modifiable then lint.try_lint() end
      end,
    })
  end,
}
