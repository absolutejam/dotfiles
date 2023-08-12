return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "debugloop/telescope-undo.nvim",
        config = function()
          require("telescope").load_extension("undo")
        end,
      },

      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },

    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>f.",
        function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end,
        desc = "Find Config File",
      },
      {
        "<leader>fu",
        "<cmd>Telescope undo<cr>",
        desc = "View Undos",
      },
      {
        "<leader>fs",
        "<cmd>Telescope lsp_document_symbols<cr>",
        "Symbols (Document)",
      },
      {
        "<leader>fS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        "Symbols (Workspace)",
      },
      {
        "<leader>fx",
        "<cmd>Telescope diagnostics<cr>",
        "Diagnostics",
      },
    },

    -- override config
    opts = function(_, opts)
      local actions_setup, actions = pcall(require, "telescope.actions")
      if not actions_setup then
        vim.notify("Could not load telescope actions", "error")
        return
      end

      local merged_opts = vim.tbl_deep_extend("force", opts, {
        defaults = {
          layout_strategy = "horizontal",
          -- layout_config = { prompt_position = "bottom" },
          winblend = 0,
          sorting_strategy = "ascending",

          mappings = {
            i = {
              ["<S-q>"] = actions.close,
              ["<S-k>"] = actions.move_selection_previous, -- move to prev result
              ["<S-j>"] = actions.move_selection_next, -- move to next result
              ["<S-x>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
            },
          },
        },
      })

      require("telescope").setup(merged_opts)
      -- TODO: vim.notify(vim.inspect(merged_opts.defaults.mappings.i))
    end,
  },
}
