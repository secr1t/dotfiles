return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
          n = {
            ["q"] = "close",
          },
        },

        layout_config = {
          horizontal = {
            preview_width = 0.6,
          },
        },

        file_ignore_patterns = {
          "node_modules",
          ".git/",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")
  end,
}
