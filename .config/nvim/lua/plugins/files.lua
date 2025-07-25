return {
    { "nvim-lua/plenary.nvim" },
    { "ThePrimeagen/harpoon" },
    { "nvim-lua/plenary.nvim", dependencies = { "OXY2DEV/markview.nvim" }, lazy = false },
    -- Set up telescope settings
    { "nvim-treesitter/nvim-treesitter" },
    { "nvim-tree/nvim-web-devicons", opts = {} },
    { "BurntSushi/ripgrep" },
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = {
                enabled = false,
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        enabled = true,
        opts = {
            disabled_filetype = { "typr" },
        },
        priority = 1001,
    },
    {
        "echasnovski/mini.pairs",
        event = "VeryLazy",
        opts = function(_, opts)
            return opts
        end,
        config = function(_, opts)
            require("mini.pairs").setup(opts)

            -- Disable for specific filetypes
            local disable_filetypes = { "typr", "TelescopePrompt", "alpha" }

            vim.api.nvim_create_augroup("MiniPairsFiletype", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = "MiniPairsFiletype",
                pattern = disable_filetypes,
                callback = function()
                    vim.b.minipairs_disable = true
                end,
            })
        end,
        priority = 1001,
    },
}
