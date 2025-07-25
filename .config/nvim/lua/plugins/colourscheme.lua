return {
  { "craftzdog/solarized-osaka.nvim" },
  { "thesimonho/kanagawa-paper.nvim" },
  { "sainnhe/gruvbox-material",      lazy = false, priority = 1000, gruvbox_material_background = "soft" },
  { "rose-pine/neovim" },
  { "cryptomilk/nightcity.nvim" },
  {
    "danilo-augusto/vim-afterglow",
    afterglow_inherit_background = 1
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "afterglow",
      afterglow_inherit_background = 1
    },
  },
}
