local map = vim.keymap.set
local ns = { noremap = true, silent = true }

-- =========================
-- NUMPAD = BUFFER CONTROL
-- =========================

-- 1–9: прямой переход к буферу (bufferline)
for i = 1, 9 do
  map("n", "<k" .. i .. ">", "<cmd>BufferLineGoToBuffer " .. i .. "<CR>", {
    desc = "Буфер " .. i,
    unpack(ns),
  })
end

-- 0: закрыть буфер (без потери данных)
map("n", "<k0>", function()
  vim.cmd("confirm bdelete")
end, { desc = "Закрыть буфер", unpack(ns) })

-- Enter: выбор буфера (удобный пикер)
map("n", "<kEnter>", "<cmd>BufferLinePick<CR>", {
  desc = "Выбрать буфер",
  unpack(ns),
})

-- + / - : переключение табов буфера (fallback навигация)
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")


-- Markdown Theme Picker
vim.keymap.set("n", "<leader>tm", function()
  require("themes.markdown").pick()
end, { desc = "Markdown Theme Picker" })
