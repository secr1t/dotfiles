return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]],     -- Ctrl + \  для открытия/закрытия
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        direction = "horizontal",     -- попробуй потом "float"
        float_opts = {
          border = "curved",
        },
      })
    end,
  },
}
