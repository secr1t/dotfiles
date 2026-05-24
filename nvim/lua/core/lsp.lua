-- Mason
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "pyright",
    "ts_ls",
  },
})

-- CMP capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
pcall(function()
  capabilities = require("cmp_nvim_lsp").default_capabilities()
end)

-- shared on_attach
local on_attach = function(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

-- NEW API CONFIG
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.config("pyright", {
  capabilities = capabilities,
  on_attach = on_attach,
})

vim.lsp.config("ts_ls", {
  capabilities = capabilities,
  on_attach = on_attach,
})

-- ENABLE SERVERS
vim.lsp.enable({
  "lua_ls",
  "pyright",
  "ts_ls",
})
