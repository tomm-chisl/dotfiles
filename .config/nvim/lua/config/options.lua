-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

opt.autowrite = false

vim.g.clipboard = {
    name = "win32yank",
    copy = {
        ["+"] = "win32yank.exe -i",
        ["*"] = "win32yank.exe -i",
    },
    paste = {
        ["+"] = "win32yank.exe -o",
        ["*"] = "win32yank.exe -o",
    },
    cache_enabled = 0,
}
