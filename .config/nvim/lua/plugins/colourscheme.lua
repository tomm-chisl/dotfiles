return {
  { "craftzdog/solarized-osaka.nvim" },
  { "thesimonho/kanagawa-paper.nvim" },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000, gruvbox_material_background = "soft" },
  { "rose-pine/neovim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
