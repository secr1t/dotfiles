return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neo-tree" },
    { "<leader>E", "<cmd>Neotree focus<cr>", desc = "Focus Neo-tree" },
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true,
        hijack_netrw_behavior = "open_default",
        filtered_items = { hide_dotfiles = false },
      },
      window = { position = "left", width = 35 },
      default_component_configs = {
        indent = { padding = 0 },
        icon = { folder_closed = "", folder_open = "" },
      },
    })
  end,
}


