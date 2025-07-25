return {
  { "nvim-neotest/neotest-jest" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
    },
    opts = {
      adapters = {
        ["neotest-jest"] = {
          jestCommand = "yarn test",
          env = { CI = true },
          cwd = function(path)
            return vim.fn.getcwd()
          end,
        },
        ["neotest-vitest"] = {},
      },
    },
  },
}
