return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "html-lsp",
        "stylua",
        "shellcheck",
        "shfmt",
        "deno",
        "lua-language-server", -- lua_ls
        "tailwindcss-language-server", -- tailwindcss
        "ansible-language-server",
        "ansible-lint",
        "astro-language-server",
        "templ",
      },
    },
  },
}
