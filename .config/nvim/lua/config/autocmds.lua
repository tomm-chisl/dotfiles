return {
  -- lua/config/autocmds.lua
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
      -- Set the main editor background to transparent
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      -- Set the background for the area after the last line to transparent
      vim.api.nvim_set_hl(0, "NonText", { bg = "none" })
      -- Set the background for inactive windows to transparent
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
      -- Set the background for the sign column to transparent
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      -- Set the background for floating windows to transparent
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  }),
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "typr",
    callback = function()
      vim.b.autopairs_disable = true
    end,
  }),
}
