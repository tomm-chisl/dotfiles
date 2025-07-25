return {
    -- lua/config/autocmds.lua
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "typr",
        callback = function()
            vim.b.autopairs_disable = true
            vim.b.minipairs_disable = true
        end,
    }),
}
