-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.listchars = "tab:> ,trail:-"

vim.filetype.add({
  extension = {
    templ = "templ",
    mdx = "mdx",
    spc = "hcl",
    fpc = "hcl",
  },
})

vim.treesitter.language.register("markdown", "mdx")

vim.opt.colorcolumn = "80"
