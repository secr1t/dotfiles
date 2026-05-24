return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>s", "<cmd>Yazi<CR>", desc = "Yazi" },
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("yazi").setup({
      dir = "~/yazi",  -- Директория для временных файлов
    })
  end,
}

