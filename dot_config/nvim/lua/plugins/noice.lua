return {
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true,
      },
      lsp = {
        hover = {
          silent = true, -- set to true to not show a message if hover is not available
        },

        -- defaults for hover and signature help
        documentation = {
          view = "hover",
          ---@type NoiceViewOptions
          opts = {
            lang = "markdown",
            replace = true,
            render = "plain",
            format = { "{message}" },
            win_options = { concealcursor = "n", conceallevel = 3 },
          },
        },
      },
    },
  },
}
