local M = {}

local path = vim.fn.stdpath("data") .. "/theme.txt"

function M.save(theme)
  local file = io.open(path, "w")
  if file then
    file:write(theme)
    file:close()
  end
end

function M.load()
  local file = io.open(path, "r")
  if not file then return nil end

  local theme = file:read("*all")
  file:close()

  return theme ~= "" and theme or nil
end

return M
