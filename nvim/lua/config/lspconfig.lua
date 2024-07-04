-- Configure diagnostics appearance
local icons = require "config.icons"

local default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = icons.diagnostics.Error },
      { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
      { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
      { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
    },
  },
  virtual_text = false,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(default_diagnostic_config)

for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
end
-- End diagnostics appearance

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end
    map("gd", require("telescope.builtin").lsp_definitions, "Goto definition")
    map("gD", vim.lsp.buf.declaration, "Goto declaration")
    map("gr", require("telescope.builtin").lsp_references, "Goto references")
    map("gI", require("telescope.builtin").lsp_implementations, "Goto implementation")
    map("gl", vim.diagnostic.open_float, "Show diagnostics")
    map("<leader>li", "<cmd>LspInfo<cr>", "Info")
    map("<leader>lt", require("telescope.builtin").lsp_type_definitions, "Type definition")
    map("<leader>ld", require("telescope.builtin").lsp_document_symbols, "Document symbols")
    map("<leader>lw", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace symbols")
    map("<leader>ll", vim.lsp.codelens.run, "CodeLens Action")
    map("<leader>lr", vim.lsp.buf.rename, "Rename")
    map("<leader>la", vim.lsp.buf.code_action, "Code action")

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
      map("<leader>th", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { event.buf }, { event.buf })
      end, "toggle inlay hints")
    end
  end,
})

local function get_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  local require_ok, cmp = pcall(require, "cmp_nvim_lsp")
  if require_ok then
    capabilities = vim.tbl_deep_extend("force", capabilities, cmp.default_capabilities())
  end
  return capabilities
end

require("neodev").setup {}

local servers = {
  marksman = {},
  pyright = {},
  ruff_lsp = {},
  bashls = {},
  lua_ls = {},
  jsonls = {},
  yamlls = {},
  rust_analyzer = {},
}
local servers_to_install = {}
for server, _ in pairs(servers) do
  local require_ok, config = pcall(require, "config.lspsettings." .. server)
  if require_ok and type(config) == "table" then
    servers[server] = config
  end
  if not config.manual_install then
    table.insert(servers_to_install, server)
  end
end

require("mason").setup()
local ensure_installed = {
  "stylua",
}

vim.list_extend(ensure_installed, servers_to_install)
require("mason-tool-installer").setup { ensure_installed = ensure_installed }

local lspconfig = require "lspconfig"
for server, config in pairs(servers) do
  config = vim.tbl_deep_extend("force", {}, {
    capabilities = get_capabilities(),
  }, config)
  lspconfig[server].setup(config)
end
