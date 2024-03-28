return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          ["<tab>"] = "toggle_node",
        },
      },
    },
    filesystem = {
      bind_to_cwd = true,
    },
  },
}
