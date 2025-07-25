return {
  "nvim-neotest/neotest",
  adapters = {
    require("neotest-haskell")({
      frameworks = {
        "hspec",
      },
    }),
  },
}
