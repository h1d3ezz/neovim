-- File & Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Netrw (File Explorer)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.netrw_banner = 0

-- Line Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.fillchars:append { eob = ' ' }
local line_number_group = vim.api.nvim_create_augroup('LineNumberToggle', { clear = true })
vim.api.nvim_create_autocmd('InsertEnter', {
  group = line_number_group,
  pattern = '*',
  callback = function() vim.opt_local.relativenumber = false end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
  group = line_number_group,
  pattern = '*',
  callback = function() vim.opt_local.relativenumber = true end,
})

-- Indentation
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Text Wrapping & Display
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.list = true
vim.opt.listchars = { tab = '→ ', trail = '·', nbsp = '␣' }

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.gdefault = true

-- Editing Behavior
vim.opt.hidden = true
vim.opt.backspace = 'indent,eol,start'
vim.opt.showmatch = true
vim.opt.matchtime = 2
vim.opt.showcmd = true
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.inccommand = 'split'

-- Window & Split Behavior
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.smoothscroll = true

-- Backup & Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.history = 1000
vim.opt.undodir = vim.fn.stdpath 'data' .. '/undodir'
vim.opt.backupdir = vim.fn.stdpath 'data' .. '/backup'
vim.opt.directory = vim.fn.stdpath 'data' .. '/swap'

-- Clipboard & System
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.isfname:append '@-@'

-- Mouse & Input
vim.opt.mouse = 'a'
vim.opt.timeoutlen = 300
vim.opt.ttimeoutlen = 10

-- UI & Appearance
vim.opt.signcolumn = 'yes'
vim.opt.laststatus = 3
vim.opt.showtabline = 2
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 10
vim.opt.pumblend = 10
vim.opt.showmode = false
vim.opt.completeopt = 'menuone,noselect,fuzzy,nosort'
vim.opt.shortmess:append { W = true, I = true, c = true, C = true }

-- Performance
vim.opt.updatetime = 200

-- Diff & Fold
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevel = 99
vim.opt.foldenable = false

-- Diagnostics
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    severity_sort = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = ' ',
      [vim.diagnostic.severity.WARN] = ' ',
      [vim.diagnostic.severity.HINT] = '󰠠 ',
      [vim.diagnostic.severity.INFO] = ' ',
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = 'minimal',
    border = 'rounded',
    source = true,
  },
}
