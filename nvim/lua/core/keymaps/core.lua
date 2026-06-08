-- =============================================
-- Основные Keymaps
-- =============================================

local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ====================== Основное ======================
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Сохранить файл" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Закрыть окно" })
map("n", "<leader>Q", "<cmd>qa<CR>", { desc = "Выйти из Neovim" })

-- Перемещение между окнами
map("n", "<C-h>", "<C-w>h", { desc = "Окно влево" })
map("n", "<C-j>", "<C-w>j", { desc = "Окно вниз" })
map("n", "<C-k>", "<C-w>k", { desc = "Окно вверх" })
map("n", "<C-l>", "<C-w>l", { desc = "Окно вправо" })

-- ====================== Буферы (Cokeline) ======================

-- Переход к буферу по номеру
for i = 1, 9 do
  map(
    "n",
    "<leader>" .. i,
    ("<Plug>(cokeline-focus-%s)"):format(i),
    { silent = true, desc = "Буфер #" .. i }
  )
end

-- Следующий / предыдущий буфер
map(
  "n",
  "<Tab>",
  "<Plug>(cokeline-focus-next)",
  { silent = true, desc = "Следующий буфер" }
)

map(
  "n",
  "<S-Tab>",
  "<Plug>(cokeline-focus-prev)",
  { silent = true, desc = "Предыдущий буфер" }
)

-- Закрытие буферов
map("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Закрыть текущий буфер" })
map("n", "<leader>X", "<cmd>bdelete!<CR>", { desc = "Закрыть буфер принудительно" })
map("n", "<leader>bc", "<cmd>%bd|e#<CR>", { desc = "Закрыть все буферы кроме текущего" })
