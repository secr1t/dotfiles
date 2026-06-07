return {
  "willothy/nvim-cokeline",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufEnter",
  config = function()
    local ok, cokeline = pcall(require, "cokeline")
    if not ok then return end

    cokeline.setup({
      default_hl = {
        fg = function(buffer)
          return buffer.is_focused and "#ffffff" or "#888888"
        end,
        bg = "#1e1e1e",
      },

      buffers = {
        new_buffers_position = "next",
      },

      rendering = {
        max_buffer_width = 25,
      },

      components = {
        {
          text = function(buffer)
            return " " .. buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer)
            return " " .. buffer.filename .. " "
          end,
        },
        {
          text = "󰅖",
          delete_buffer_on_left_click = true,
        },
      },
    })
  end,
}
