local M = {}

function M.setup()
  vim.cmd("highlight clear")
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "secr1t"

  local colors = {
    bg  = "#282420",
    fg  = "#e5c6a8",
    cursor = "#f6f6ec",
    sel_bg = "#111417",
    sel_fg = "#282420",

    black  = "#111417",
    gray   = "#665e54",
    red    = "#c84134",
    green  = "#84c44b",
    yellow = "#f4ae2e",
    blue   = "#1397b9",
    orange = "#d0623c",
    teal   = "#4f9452",

    bright_red    = "#ff6459",
    bright_green  = "#97e035",
    bright_yellow = "#dfd561",
    bright_blue   = "#5ed9ff",
    bright_orange = "#ff9168",
    bright_teal   = "#83ef88",
  }

  local set = vim.api.nvim_set_hl

  -- База
  set(0, "Normal",       { fg = colors.fg, bg = colors.bg })
  set(0, "Cursor",       { fg = colors.bg, bg = colors.cursor })
  set(0, "Visual",       { fg = colors.sel_fg, bg = colors.sel_bg })
  set(0, "LineNr",       { fg = colors.gray })
  set(0, "CursorLineNr", { fg = colors.yellow, bold = true })

  -- Синтаксис
  set(0, "Comment",      { fg = colors.gray, italic = true })
  set(0, "Keyword",      { fg = colors.orange, bold = true })
  set(0, "Function",     { fg = colors.blue })
  set(0, "String",       { fg = colors.green })
  set(0, "Number",       { fg = colors.yellow })
  set(0, "Identifier",   { fg = colors.fg })
  set(0, "Type",         { fg = colors.teal })
  set(0, "Operator",     { fg = colors.bright_orange })

  -- Git (gitsigns)
  set(0, "GitSignsAdd",    { fg = colors.green })
  set(0, "GitSignsChange", { fg = colors.yellow })
  set(0, "GitSignsDelete", { fg = colors.red })

  -- Pmenu (cmp)
  set(0, "Pmenu",         { fg = colors.fg, bg = colors.black })
  set(0, "PmenuSel",      { fg = colors.sel_fg, bg = colors.sel_bg })
  set(0, "PmenuBorder",   { fg = colors.gray, bg = colors.black })
end

return M
