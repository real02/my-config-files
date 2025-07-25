-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "python" },
  callback = function()
    vim.b.autoformat = true
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "html", "markdown", "mmd", "text", "mail", "gitcommit" },
  command = "runtime macros/emoji-ab.vim",
})
