local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

function M.common_capabilities()
  -- LSP servers and clients are able to communicate to each other what features they support.
  --  By default, Neovim doesn't support everything that is in the LSP specification.
  --  When we add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
  --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  return capabilities
end

function M.config()
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
        end, "Toggle inlay hints")
      end
    end,
  })

  -- Configure diagnostics appearance
  local icons = require "custom.icons"

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

  local servers = {
    "lua_ls",
    "marksman",
    "pyright",
    "ruff_lsp",
    "bashls",
    "jsonls",
  }

  for _, server in pairs(servers) do
    local opts = {
      capabilities = M.common_capabilities(),
    }

    local require_ok, settings = pcall(require, "custom.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
    end

    require("lspconfig")[server].setup(opts)
  end
end

return M
