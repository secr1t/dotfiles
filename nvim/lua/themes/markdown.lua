local M = {}

-- Список тем
M.themes = {
  default = {
    name = "Default",
    setup = function()
      require("render-markdown").setup({
        heading = { icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " } },
        code = { style = "full", right_pad = 2 },
      })
    end,
  },
  obsidian = {
    name = "Obsidian",
    setup = function()
      require("render-markdown").setup({
        heading = {
          icons = { "◉ ", "○ ", "◆ ", "◇ ", "▣ ", "▢ " },
          position = "overlay",
        },
        code = { style = "full", width = "full", right_pad = 4 },
        bullet = { icons = { "•", "◦", "▸", "▹" } },
      })
    end,
  },
  minimal = {
    name = "Minimal",
    setup = function()
      require("render-markdown").setup({
        heading = { enabled = true, icons = { "# ", "## ", "### " } },
        code = { style = "normal" },
        bullet = { enabled = false },
      })
    end,
  },
}

-- Главная функция выбора (2 уровня)
M.pick = function()
  local theme_names = vim.tbl_keys(M.themes)

  require("telescope.pickers").new({}, {
    prompt_title = "Markdown Theme",
    finder = require("telescope.finders").new_table({
      results = theme_names,
      entry_maker = function(theme_key)
        return {
          value = theme_key,
          display = M.themes[theme_key].name,
          ordinal = M.themes[theme_key].name,
        }
      end,
    }),
    sorter = require("telescope.config").values.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      map("i", "<CR>", function()
        local selection = require("telescope.actions.state").get_selected_entry()
        require("telescope.actions").close(prompt_bufnr)

        local theme = M.themes[selection.value]
        if theme and theme.setup then
          theme.setup()
          vim.notify("Markdown theme: " .. theme.name, vim.log.levels.INFO)
        end
      end)
      return true
    end,
  }):find()
end

return M
