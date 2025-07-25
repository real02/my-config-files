-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.mouse = "a"  -- Enable mouse support in all modes

vim.api.nvim_set_keymap(
  "n",
  "<C-LeftMouse>",
  "<Cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
