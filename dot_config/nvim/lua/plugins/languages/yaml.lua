-- yamlls Language server
-- https://github.com/redhat-developer/yaml-language-server
return {
  -- https://www.lazyvim.org/extras/lang/yaml
  { import = "lazyvim.plugins.extras.lang.yaml" },

  -- extended from lazyvim.plugins.extras.lang.yaml
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          -- lazy-load schemastore when needed
          on_new_config = function(new_config)
            new_config.settings.yaml.schemas = new_config.settings.yaml.schemas or {}
            vim.list_extend(new_config.settings.yaml.schemas, {
              {
                description = "Kubernetes",
                fileMatch = "/*.yaml",
                name = "kubernetes",
                url = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.20.13/all.json",
              },

              -- TODO:
              -- ["https://json.schemastore.org/chart.json"] = "Chart.yaml",
              -- ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
              -- ["https://raw.githubusercontent.com/rancher/k3d/main/pkg/config/v1alpha3/schema.json"] = "k3d.yaml",
            })
          end,
          settings = {
            yaml = {
              format = { enable = false },
              schemaDownload = { enable = true },
            },
          },
        },
      },
    },
  },

  {
    "someone-stole-my-name/yaml-companion.nvim",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    opts = function()
      require("telescope").load_extension("yaml_schema")
    end,
  },
}
