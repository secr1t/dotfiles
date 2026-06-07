local M = {}

function M.setup()
  vim.cmd("highlight clear")
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "secr1t_graphite"

  local colors = {
    bg      = "#0e0e0f",
    fg      = "#dcdcdc",
    cursor  = "#bfbfbf",
    sel_bg  = "#1a1a1a",
    sel_fg  = "#dcdcdc",

    black   = "#0e0e0f",
    gray    = "#4a4a4a",
    red     = "#8a8a8a",
    green   = "#8a8a8a",
    yellow  = "#dcdcdc",
    blue    = "#8a8a8a",
    orange  = "#8a8a8a",
    teal    = "#8a8a8a",

    bright_red    = "#ffffff",
    bright_green  = "#ffffff",
    bright_yellow = "#ffffff",
    bright_blue   = "#ffffff",
    bright_orange = "#ffffff",
    bright_teal   = "#ffffff",
  }

  local set = vim.api.nvim_set_hl

  -- База
  set(0, "Normal",       { fg = colors.fg, bg = colors.bg })
  set(0, "Cursor",       { fg = colors.bg, bg = colors.cursor })
  set(0, "Visual",       { fg = colors.sel_fg, bg = colors.sel_bg })
  set(0, "LineNr",       { fg = colors.gray })
  set(0, "CursorLineNr", { fg = colors.fg, bold = true })

  -- Синтаксис
  set(0, "Comment",      { fg = colors.gray, italic = true })
  set(0, "Keyword",      { fg = colors.fg, bold = true })
  set(0, "Function",     { fg = colors.fg })
  set(0, "String",       { fg = colors.fg })
  set(0, "Number",       { fg = colors.fg })
  set(0, "Identifier",   { fg = colors.fg })
  set(0, "Type",         { fg = colors.fg })
  set(0, "Operator",     { fg = colors.fg })

  -- Git (gitsigns)
  set(0, "GitSignsAdd",    { fg = colors.gray })
  set(0, "GitSignsChange", { fg = colors.gray })
  set(0, "GitSignsDelete", { fg = colors.gray })

  -- Pmenu (cmp)
  set(0, "Pmenu",         { fg = colors.fg, bg = colors.black })
  set(0, "PmenuSel",      { fg = colors.sel_fg, bg = colors.sel_bg })
  set(0, "PmenuBorder",   { fg = colors.gray, bg = colors.black })
end

return M
