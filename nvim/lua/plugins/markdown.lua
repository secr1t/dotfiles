return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "markdown", "markdown_inline", "rust", "lua", "python", "bash" },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    config = function()
      -- Базовая конфигурация по умолчанию
      require("render-markdown").setup({
        heading = { enabled = true },
        code = { enabled = true, style = "full" },
        bullet = { enabled = true },
        checkbox = { enabled = true },
      })
    end,
  },
}
