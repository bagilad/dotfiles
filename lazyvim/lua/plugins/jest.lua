return {
  {
    "nvim-neotest/neotest",
    dependencies = { "nvim-neotest/neotest-jest" },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "pnpm exec jest",
          -- run jest from the package that owns the test file (monorepo)
          cwd = function(file)
            return vim.fs.root(file, "package.json")
          end,
        },
      },
    },
  },
}
