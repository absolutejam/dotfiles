return {
  -- add rego-ls
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    init = function()
      require("lspconfig").regols.setup({})
    end,
  },
}
