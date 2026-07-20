-- Core & Config
vim.keymap.set('n', '<leader>re', '<cmd>restart<cr>', { desc = 'Restart config :restart' })
vim.keymap.set('n', '<leader>ev', function()
  vim.cmd.edit {
    args = { vim.fn.stdpath 'config' .. '/init.lua' },
  }
end, { desc = 'Edit Neovim config' })
vim.keymap.set('n', '<leader>so', '<cmd>source %<CR>', { desc = 'Source current file' })
vim.keymap.set('n', '<leader>l', '<cmd>Lazy<cr>', { desc = 'Lazy UI' })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })

-- File Operations
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
vim.keymap.set('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New File' })

-- Buffer Management
vim.keymap.set('n', ']b', '<cmd>bnext<CR>', {
  desc = 'Next buffer',
})
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>', {
  desc = 'Previous buffer',
})
vim.keymap.set('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bb', '<cmd>e #<CR>', { desc = 'Switch to alternate buffer' })

-- Window Management
vim.keymap.set('n', '<C-Left>', '<C-w>h', { desc = 'Focus left window' })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { desc = 'Focus bottom window' })
vim.keymap.set('n', '<C-Up>', '<C-w>k', { desc = 'Focus top window' })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { desc = 'Focus right window' })
vim.keymap.set('n', '<leader>wh', '<C-w>H', { desc = 'Move split left' })
vim.keymap.set('n', '<leader>wj', '<C-w>J', { desc = 'Move split down' })
vim.keymap.set('n', '<leader>wk', '<C-w>K', { desc = 'Move split up' })
vim.keymap.set('n', '<leader>wl', '<C-w>L', { desc = 'Move split right' })

-- Scrolling & Navigation
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down in buffer with cursor centered' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up in buffer with cursor centered' })
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Search
vim.keymap.set({ 'i', 'n', 's' }, '<esc>', function()
  vim.cmd 'noh'
  return '<esc>'
end, { expr = true, desc = 'Escape and Clear hlsearch' })
vim.keymap.set('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
vim.keymap.set('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Replace word cursor is on globally' })

-- Delete & Paste
vim.keymap.set({ 'n', 'v' }, 'D', [["_d]], { desc = 'Delete without yanking' })
vim.keymap.set('x', 'p', [["_dP]], { desc = 'Paste over selection without losing yanked text' })

-- Yank & Copy
vim.keymap.set('n', '<leader>yy', '<cmd>%y+<CR>', { desc = 'Yank entire file to clipboard' })

-- Text Manipulation
vim.keymap.set('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
vim.keymap.set('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
vim.keymap.set('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Down' })
vim.keymap.set('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Up' })
vim.keymap.set('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
vim.keymap.set('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join lines and return cursor' })
vim.keymap.set('n', '<leader>d', '<cmd>t.<CR>', { desc = 'Duplicate line' })
vim.keymap.set('n', 'U', '<C-r>', { desc = 'Redo' })
vim.keymap.set('i', ',', ',<c-g>u')
vim.keymap.set('i', '.', '.<c-g>u')
vim.keymap.set('i', ';', ';<c-g>u')

-- Indentation
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Unindent and keep selection' })
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent and keep selection' })

-- Comments
vim.keymap.set('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Below' })
vim.keymap.set('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', { desc = 'Add Comment Above' })

-- Terminal
vim.keymap.set('n', '<leader>tt', '<cmd>split | terminal<CR>', { desc = '[T]oggle terminal in split' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- QuickFix & Location Lists
vim.keymap.set('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
vim.keymap.set('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })
vim.keymap.set('n', '<leader>ln', '<cmd>lnext<CR>zz', { desc = 'Next location item' })
vim.keymap.set('n', '<leader>lp', '<cmd>lprev<CR>zz', { desc = 'Previous location item' })
vim.keymap.set('n', '<leader>xq', function()
  local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
  if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = 'Quickfix List' })
vim.keymap.set('n', '<leader>xl', function()
  local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
  if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = 'Location List' })

-- Diagnostics & Developer Tools
vim.keymap.set('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })
vim.keymap.set('n', '<leader>ui', vim.show_pos, { desc = 'Inspect Pos' })
vim.keymap.set('n', '<leader>uI', function()
  vim.treesitter.inspect_tree()
  vim.api.nvim_input 'I'
end, { desc = 'Inspect Tree' })

-- Map Ctrl + Left Click to open the link under the cursor
vim.keymap.set('n', '<C-LeftMouse>', function()
  local cursor_pos = vim.fn.getmousepos()
  vim.api.nvim_win_set_cursor(cursor_pos.winid, { cursor_pos.line, cursor_pos.column - 1 })
  vim.ui.open(vim.fn.expand '<cfile>')
end, { desc = 'Open link under cursor with Ctrl+Click' })
