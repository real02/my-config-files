return {
  "mfussenegger/nvim-jdtls",
  opts = {
    settings = {
      ["java.format.settings.url"] = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      pattern = "*.java",
      command = ":! google-java-format -r <afile>",
    })
  end,
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = { ensure_installed = { "google-java-format" } },
    },
  },
}
