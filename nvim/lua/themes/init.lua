local M = {}

M.list = {
  "graphite",
  "undertale",
}

M.current = nil

function M.apply(name)
  local ok, theme = pcall(require, "themes." .. name)
  if not ok then
    vim.notify("Theme not found: " .. name, vim.log.levels.ERROR)
    return
  end

  if theme.setup then
    vim.cmd("highlight clear")
    vim.o.termguicolors = true
    vim.o.background = "dark"

    theme.setup()
  end

  M.current = name
end

return M


