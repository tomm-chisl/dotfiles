-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp")
require("config.autocmds")
-- Make background transparent
function Transparent()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
function DisableInlay()
    vim.lsp.inlay_hint.enable(false)
end
vim.cmd.colorscheme("kanagawa-paper")

Transparent()
DisableInlay()
