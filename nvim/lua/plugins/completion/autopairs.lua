return {
  -- Автозакрытие скобок, кавычек, тегов
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      local autopairs = require("nvim-autopairs")
      autopairs.setup({
        check_ts = true,          -- интеграция с Treesitter
        enable_check_bracket_line = true,
      })

      -- Интеграция с nvim-cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Сниппеты (очень важно)
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      local luasnip = require("luasnip")
      luasnip.config.set_config({
        history = true,
        updateevents = "TextChanged,TextChangedI",
      })

      -- Загружаем сниппеты (VSCode-style)
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },

  -- Автозакрытие тегов HTML, JSX, TSX и т.д.
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
