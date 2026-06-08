-- Live Server
vim.keymap.set("n", "<leader>ls", function()
  local file = vim.fn.expand("%:p")
  local dir = vim.fn.expand("%:p:h")

  -- Если открыт index.html — запускаем оттуда
  if vim.fn.filereadable(dir .. "/index.html") == 1 then
    vim.fn.jobstart("live-server " .. dir, { detach = true })
    vim.notify("Live Server запущен в папке: " .. dir, vim.log.levels.INFO)
  else
    vim.fn.jobstart("live-server " .. dir, { detach = true })
    vim.notify("Live Server запущен", vim.log.levels.INFO)
  end
end, { desc = "Запустить Live Server" })

-- Остановить все live-server (если нужно)
vim.keymap.set("n", "<leader>lS", function()
  vim.fn.jobstart("pkill -f live-server")
  vim.notify("Live Server остановлен", vim.log.levels.INFO)
end, { desc = "Остановить Live Server" })
