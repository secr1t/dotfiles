return {
  name = "Default",
  setup = function()
    require("render-markdown").setup({
      heading = { icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " } },
      code = { style = "full", right_pad = 2 },
    })
  end,
}
