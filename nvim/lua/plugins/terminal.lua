return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 14,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        direction = "horizontal",
        start_in_insert = true,
        persist_size = true,
        close_on_exit = false,

        shell = "/usr/bin/fish",

        env = {
          NVIM_TERMINAL = "1",
          FISH_GREETING = "",
        },

        -- Автоматически открывать в директории текущего файла
        on_open = function(term)
          vim.cmd("setlocal winbar=")
          vim.cmd("setlocal laststatus=0")

          -- Переходим в директорию текущего буфера
          local buf_dir = vim.fn.expand("%:p:h")
          if vim.fn.isdirectory(buf_dir) == 1 then
            vim.api.nvim_chan_send(term.job_id, "cd " .. vim.fn.shellescape(buf_dir) .. "\n")
          end

          vim.defer_fn(function()
            vim.api.nvim_chan_send(term.job_id, "set -e fish_greeting\n")
            vim.api.nvim_chan_send(term.job_id, "clear\n")
          end, 50)
        end,

        on_close = function()
          vim.cmd("setlocal laststatus=2")
        end,
      })
    end,
  },
}
