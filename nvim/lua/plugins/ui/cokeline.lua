return {
  "willothy/nvim-cokeline",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local cokeline = require("cokeline")

    cokeline.setup({
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and "#ffffff" or "#a0a0a0"
        end,
        bg = function(buffer)
          return buffer.is_focused and "#3a3a4a" or "#1e1e2e"
        end,
      },

      components = {
        {
          text = function(buffer)
            return buffer.index .. " "
          end,
          fg = "#7aa2f7",
        },
        {
          text = function(buffer)
            return buffer.devicon.icon .. " "
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            return buffer.filename .. " "
          end,
        },
        {
          text = "",
          fg = "#ff5555",
          on_click = function(_, _, _, _, buffer)
            vim.api.nvim_buf_delete(buffer.id, { force = true })
          end,
        },
      },

      -- Новый способ фильтрации (актуальный)
      buffers = {
        filter_valid = function(buffer)
          return buffer.type ~= "terminal"
        end,
      },

      sidebar = {
        filetype = { "neo-tree", "alpha" },
        components = {
          {
            text = "   Neo-tree   ",
            fg = "#7aa2f7",
            bg = "#1e1e2e",
          },
        },
      },
    })
  end,
}
