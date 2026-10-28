return {
  {
    "mfussenegger/nvim-dap",
    opts = function()
      -- .vscode/launch.json configs often omit "cwd" because VS Code defaults it
      -- to the workspace folder. nvim-dap has no such default, so the program may
      -- run from another dir and break anything cwd-relative (e.g. .env loading).
      -- Default it to nvim's cwd; configs that set "cwd" are left alone.
      require("dap").listeners.on_config["default-cwd"] = function(config)
        if config.cwd == nil then
          config = vim.deepcopy(config)
          config.cwd = vim.fn.getcwd()
        end
        return config
      end
    end,
  },
}
