-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("go", { clear = true }),
  pattern = { "go" },
  callback = function()
    vim.bo.tabstop = 8 -- A TAB character looks like 4 spaces
    vim.bo.expandtab = false -- Pressing the TAB key will insert spaces instead of a TAB character
    vim.bo.shiftwidth = 8 -- Number of spaces inserted when indenting
  end,
})

--vim.api.nvim_create_autocmd("FileType", {
--  group = vim.api.nvim_create_augroup("go_disable_lsp", { clear = true }),
--  pattern = { "*.tmpl.html" },
--  callback = function()
--    vim.notify("template")
--    vim.opt.filetype = "gohtmltmpl"
--    vim.cmd("LspStop gopls")
--  end,
--})
