return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Рекомендую именно ^5
    lazy = false,
    ft = { "rust" },
    config = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                command = "clippy",
              },
              inlayHints = {
                bindingModeHints = { enable = true },
                chainingHints = { enable = true },
                closingBraceHints = { enable = true },
                closureReturnTypeHints = { enable = "always" },
                lifetimeElisionHints = { enable = "always" },
                parameterHints = { enable = true },
                typeHints = { enable = true },
              },
              diagnostics = {
                enable = true,
                disabled = { "unresolved-proc-macro" }, -- часто спамит
              },
            },
          },
        },
      }
    end,
  },
}
