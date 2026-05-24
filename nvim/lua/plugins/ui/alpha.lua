return {
  "goolord/alpha-nvim",
  event = "VimEnter",

  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local builtin = require("telescope.builtin")

    -- Project directories
    local project_dirs = {
      ["󰙅  Projects"] = "~/Projects",
      ["  Neovim Config"] = "~/.config/nvim",
      ["󰈙  Notes"] = "/mnt/hdd/Obsidian",
      ["󰉋  Downloads"] = "~/Downloads"
    }

    -- Project picker command
    vim.api.nvim_create_user_command("ProjectPicker", function()
      vim.ui.select(vim.tbl_keys(project_dirs), {
        prompt = "Select directory",
      }, function(choice)
        if choice then
          builtin.find_files({
            cwd = vim.fn.expand(project_dirs[choice]),
          })
        end
      end)
    end, {})

    -- Header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button(
        "f",
        "󰱼  Find File",
        ":Telescope find_files<CR>"
      ),

      dashboard.button(
        "p",
        "󰙅  Projects",
        ":ProjectPicker<CR>"
      ),

      dashboard.button(
        "r",
        "󱋡  Recent Files",
        ":Telescope oldfiles<CR>"
      ),

      dashboard.button(
        "q",
        "󰈆  Quit",
        ":qa<CR>"
      ),
    }

    dashboard.opts.opts.noautocmd = true

    alpha.setup(dashboard.opts)
  end,
}
