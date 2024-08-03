return {
  --{ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = {
  --  flavour = "macchiato",
  --} },
  {
    "sainnhe/gruvbox-material",
    name = "gruvbox-material",
    priority = 1000,
    opts = function(_, opts)
      if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
      end

      vim.opt.background = "dark"

      vim.g.gruvbox_material_background = "medium"

      vim.g.gruvbox_material_better_performance = 1

      vim.cmd([[colorscheme gruvbox-material]])
      vim.cmd([[hi Cursor guifg=bg guibg=fg]])
      return opts
    end,
  },
}
