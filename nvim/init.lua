-- init.lua

require("core.options")
require("plugins.terminal")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  local ok = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
  -- не фейлимся жестко — просто логируем при ошибке
  if vim.v.shell_error ~= 0 then
    vim.notify("lazy.nvim bootstrap failed: " .. tostring(ok), vim.log.levels.WARN)
  end
end

vim.opt.rtp:prepend(lazypath)

local ok_lazy, lazy = pcall(require, "lazy")
if not ok_lazy then
  vim.notify("Failed to require lazy.nvim: " .. tostring(lazy), vim.log.levels.ERROR)
  return
end

lazy.setup({
  { import = "plugins.ui" },
  { import = "plugins.navigation" },
  { import = "plugins.completion" },
  { import = "plugins.lsp" },
  { import = "plugins.git" },
  { import = "plugins.terminal" },
  { import = "plugins.markdown" },
  { import = "plugins.treesitter" },
  { import = "plugins.rustaceanvim" },

})

-- keymaps may reference plugins — загружаем после lazy.setup
pcall(require, "core.keymaps")

-- тема — pcall на случай отсутствия/ошибок
pcall(function()
  require("themes.graphite").setup()
end)

