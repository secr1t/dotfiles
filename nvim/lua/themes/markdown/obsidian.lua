return {
  name = "Obsidian Style",
  setup = function()
    require("render-markdown").setup({
      heading = {
        icons = { "◉ ", "○ ", "◆ ", "◇ ", "▣ ", "▢ " },
        position = "overlay",
      },
      code = { style = "full", width = "full" },
      bullet = { icons = { "•", "◦", "▸" } },
    })
  end,
}
