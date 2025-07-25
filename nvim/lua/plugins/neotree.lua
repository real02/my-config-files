return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        auto_open = false,
        update_focused_file = {
          enable = true,
        },
        filesystem = {
          group_empty_dirs = true,
          scan_mode = "deep",
          filtered_items = {
            visible = true,
          },
        },
        window = {
          mappings = {
            ["o"] = "open",
            ["-"] = "navigate_up",
          },
        },
      })
    end,
  },
}
