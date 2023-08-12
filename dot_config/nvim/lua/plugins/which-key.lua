return {
  -- change some which-key options and a keymap to browse plugin files
  {
    "folke/which-key.nvim",

    -- override some options
    opts = function(_, opts)
      opts.window = {
        border = "rounded", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,
      }

      opts.plugins = {
        marks = true,
        registers = true,

        spelling = {
          enabled = true,
          suggestions = 20,
        },

        ignore_missing = false,

        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
          operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
          motions = true, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      }
    end,
  },
}
