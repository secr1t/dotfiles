return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- Отложенная загрузка, чтобы избежать ошибки
      vim.defer_fn(function()
        local ok, configs = pcall(require, "nvim-treesitter.configs")
        if ok then
          configs.setup({
            ensure_installed = {
              "lua", "rust", "python", "javascript", "typescript", "tsx",
              "html", "css", "json", "yaml", "toml", "markdown", "markdown_inline",
              "bash", "fish"
            },
            highlight = { enable = true },
            indent = { enable = true },
          })
          vim.notify("Treesitter loaded successfully", vim.log.levels.INFO)
        else
          vim.notify("Treesitter not ready yet", vim.log.levels.WARN)
        end
      end, 200)
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    config = function()
      require("render-markdown").setup({
        heading = { enabled = true },
        code = { enabled = true, style = "full" },
        bullet = { enabled = true },
        checkbox = { enabled = true },
      })
    end,
  },
}
