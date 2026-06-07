return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Header
    dashboard.section.header.val = {                                          
"                                          ",
"██▄  ▄██ ██████ ▄████▄ ██  ██ ██ ██▄  ▄██ ",
"██ ▀▀ ██ ██▄▄   ██  ██ ██▄▄██ ██ ██ ▀▀ ██ ",
"██    ██ ██▄▄▄▄ ▀████▀  ▀██▀  ██ ██    ██ ",
"                                          ",
    }

    -- Кнопки — фиксированный порядок
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰱼  Find File",           ":Telescope find_files<CR>"),
      dashboard.button("r", "󱋡  Recent Files",        ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Neovim Config",             ":Telescope file_browser cwd=~/.config/nvim<CR>"),


      { type = "padding", val = 2 },

      -- Projects (фиксированные кнопки)
      { type = "text",    val =
                                               
                                               
"▄▄▄▄  ▄▄▄▄   ▄▄▄    ▄▄ ▄▄▄▄▄  ▄▄▄▄ ▄▄▄▄▄▄ ▄▄▄▄" ,
"██▄█▀ ██▄█▄ ██▀██   ██ ██▄▄  ██▀▀▀   ██  ███▄▄",
"██    ██ ██ ▀███▀ ▄▄█▀ ██▄▄▄ ▀████   ██  ▄▄██▀" ,
                                               
                                                                   
      opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1 },

      dashboard.button("p", "󰙅  Edge Projects",           ":Telescope file_browser cwd=/mnt/hdd/EdgeProject<CR>"),
      dashboard.button("s", "󰙅  Personal Projects",           ":Telescope file_browser cwd=/mnt/hdd/Projects<CR>"),
      dashboard.button("n", "󰈙  Notes",              ":Telescope file_browser cwd=/mnt/hdd/Obsidian<CR>"),
      dashboard.button("d", "󰉋  Downloads",          ":Telescope file_browser cwd=~/Downloads<CR>"),

      { type = "padding", val = 2 },

      dashboard.button("q", "󰈆  Quit", ":qa<CR>"),
    }

    dashboard.opts.opts.noautocmd = true
    alpha.setup(dashboard.opts)

    -- Отключаем нумерацию в Alpha
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })
  end,
}
