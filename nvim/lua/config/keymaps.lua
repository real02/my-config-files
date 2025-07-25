-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "J", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "K", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
map("n", "<c-j>", vim.lsp.buf.hover, { desc = "Show hover" })

local git = require("gitsigns")
map("n", "<leader>hj", git.next_hunk, { desc = "Next Hunk" })
map("n", "<leader>hk", git.prev_hunk, { desc = "Previous Hunk" })

-- Neo tree on -
map("n", "-", ":Neotree position=current %:h<CR>", { desc = "Toggle NeoTree" })

vim.api.nvim_set_keymap(
  "n",
  "<C-LeftMouse>",
  "<Cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)
