vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end
        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")

        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")

        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")

        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")

        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")

        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")

        map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
    end,
})

vim.diagnostic.config({
    severity_sort = true,
    float = {
        focusable = true,
        style = "minimal",
        border = "single",
        source = "if_many",
        header = "",
        prefix = "",
        suffix = "",
    },
    underline = { severity = vim.diagnostic.severity.ERROR, vim.diagnostic.severity.WARN },
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
    },
    virtual_text = false,
    virtual_lines = false,
})

-- This is copied straight from blink
-- https://cmp.saghen.dev/installation#merging-lsp-capabilities
local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        },
    },
}

capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.inlay_hint.enable(false)
vim.lsp.config("*", {
    capabilities = capabilities,
    opts = {
        inlay_hints = { enabled = false },
    },
    root_markers = { ".git" },
})

local function on_attach(client, buffer)
    if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    end
end

vim.lsp.config.rust_analyzer = {
    on_attach = on_attach,
    capabilities = capabilities,
    opts = {
        inlay_hints = { enabled = false },
    },
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { "Cargo.toml", ".git" },
    single_file_support = true,
    settings = {
        ["rust-analyzer"] = {
            diagnostics = {
                enable = false,
            },
            inlayHints = {
                maxLength = 0,
            },
        },
    },
    before_init = function(init_params, config)
        -- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
        if config.settings and config.settings["rust-analyzer"] then
            init_params.initializationOptions = config.settings["rust-analyzer"]
        end
    end,
}

-- Golang
vim.lsp.config.gopls = {
    -- Command and arguments to start the server.
    cmd = { "gopls" },
    -- Filetypes to automatically attach to.
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    -- Sets the "workspace" to the directory where any of these files is found.
    -- Files that share a root directory will reuse the LSP server connection.
    -- Nested lists indicate equal priority, see |vim.lsp.Config|.
    root_markers = { "go.mod", "go.work", ".git", ".gitignore" },
    -- Specific settings to send to the server. The schema is server-defined.
    -- Example: https://raw.githubusercontent.com/LuaLS/vscode-lua/master/setting/schema.json
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
        },
    },
}

vim.lsp.config.ty = {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_dir = vim.fs.root(0, { ".git/", "pyproject.toml" }),
    settings = {},
}

vim.lsp.enable({ "gopls", "ruff", "ruff-lsp", "rust_analyzer", "ty" })
