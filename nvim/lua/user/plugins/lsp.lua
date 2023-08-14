local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  event = { "BufReadPre" },
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
}

function M.config()
  local lspconfig = require "lspconfig"
  local lsp_defaults = lspconfig.util.default_config
  lsp_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lsp_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )
  for _, server in pairs(require("user.lsp.servers")) do
    local opts = {}
    local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
    if require_ok then
      opts = conf_opts
    else
      print("No user defined options for lsp server", server)
    end
    lspconfig[server].setup(opts)
  end

  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    update_in_insert = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
      suffix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

return M
