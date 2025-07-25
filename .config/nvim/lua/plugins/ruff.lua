return {
    vim.lsp.config("ruff", {
        init_options = {
            settings = {
                -- Ruff language server settings go here
            },
        },
    }),

    vim.lsp.config("ruff-lsp", {
        init_options = {
            settings = {
                filetypes = { "python" },
            },
        },
    }),
}
