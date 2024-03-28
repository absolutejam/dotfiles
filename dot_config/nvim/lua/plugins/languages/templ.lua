return {
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    init = function()
      require("lspconfig").templ.setup({})
    end,
  },
}
