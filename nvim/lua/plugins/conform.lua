return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<c-f>",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      mode = "",
      desc = "Format file or range (visual mode)",
    },
  },
  config = function()
    local conform = require "conform"
    conform.setup {
      -- Define your formatters
      formatters_by_ft = {
        lua = { "stylua" },
        python = function(bufnr)
          if require("conform").get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_format" }
          else
            return { "isort", "black" }
          end
        end,
      },
      javascript = { "prettier" },
      typescript = { "prettier" },
      javascriptreact = { "prettier" },
      typescriptreact = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      graphql = { "prettier" },
      markdown = { "prettier" },
      -- format_on_save = function(bufnr)
      --   -- Disable "format_on_save lsp_fallback" for languages that don't
      --   -- have a well standardized coding style.
      --   local ignore_filetypes = { "c", "cpp" }
      --   if
      --     vim.g.disable_autoformat
      --     or vim.b[bufnr].disable_autoformat
      --     or vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype)
      --   then
      --     return
      --   end
      --   return {
      --     timeout_ms = 500,
      --     lsp_fallback = true,
      --   }
      -- end,
    }
  end,
}
