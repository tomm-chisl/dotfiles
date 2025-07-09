-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>")

-- Find files using Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

-- Harpoon keymaps
local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", harpoon_mark.add_file, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-e>", harpoon_ui.toggle_quick_menu, { desc = "Harpoon toggle quick menu" })
vim.keymap.set("n", "<C-h>", function()
  harpoon_ui.nav_file(1)
end, { desc = "Harpoon jump to file 1" })
vim.keymap.set("n", "<C-j>", function()
  harpoon_ui.nav_file(2)
end, { desc = "Harpoon jump to file 2" })
vim.keymap.set("n", "<C-k>", function()
  harpoon_ui.nav_file(3)
end, { desc = "Harpoon jump to file 3" })
vim.keymap.set("n", "<C-l>", function()
  harpoon_ui.nav_file(4)
end, { desc = "Harpoon jump to file 4" })

-- See diagnostic of issue from lsp
vim.keymap.set(
  "n",
  "<leader>dd",
  vim.diagnostic.open_float,
  { desc = "[d]isplay [d]iagnostic", noremap = true, silent = true }
)
