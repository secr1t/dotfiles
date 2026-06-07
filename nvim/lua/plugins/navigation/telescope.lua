return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-file-browser.nvim" },   -- ← добавили
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<esc>"] = "close",
          },
          n = { ["q"] = "close" },
        },
        path_display = { "truncate" },
        prompt_prefix = "   ",
        selection_caret = " ",
      },
    })

    -- Загружаем расширение
    telescope.load_extension("file_browser")
  end,
}
