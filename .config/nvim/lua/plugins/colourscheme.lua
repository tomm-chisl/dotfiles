return {
  { "craftzdog/solarized-osaka.nvim" },
  { "thesimonho/kanagawa-paper.nvim" },
  { "sainnhe/gruvbox-material", lazy = false, priority = 1000, gruvbox_material_background = "soft" },
  { "rose-pine/neovim" },
  { "cryptomilk/nightcity.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nightcity",
    },
  },
}
