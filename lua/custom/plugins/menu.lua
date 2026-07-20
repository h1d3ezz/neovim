---@module 'lazy'
---@type LazySpec
return {
  {
    'nvzone/menu',
    dependencies = { 'nvzone/volt' },
    lazy = true,
    init = function()
      vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
        local status_ok, menu_utils = pcall(require, 'menu.utils')
        if not status_ok then return end

        menu_utils.delete_old_menus()

        vim.cmd "normal! \\<RightMouse>"

        local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
        local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

        require("menu").open(options, { mouse = true })
      end, { desc = "Open context menu" })
    end,
  }
}
