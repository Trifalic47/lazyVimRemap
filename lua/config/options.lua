-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- SAME TO SAME AS PRIMEAGEN'S SET.LUA
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "120"

vim.opt.clipboard:append("unnamedplus")

-- Additional Performance tweaks from before
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 0
vim.o.shada = "!,'100,<50,s10,h"
vim.o.lazyredraw = true
vim.o.redrawtime = 1500

-- Smoothness: Fix potential lag from clipboard on Linux (re-added)
if vim.fn.has("linux") == 1 then
    vim.g.clipboard = {
        name = "myClipboard",
        copy = {
            ["+"] = "wl-copy",
            ["*"] = "wl-copy",
        },
        paste = {
            ["+"] = "wl-paste",
            ["*"] = "wl-paste",
        },
        cache_enabled = 1,
    }
end

-- Disable netrw for Oil
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable inlay hints global (LazyVim way)
vim.g.lazyvim_lsp_inlay_hints = false

-- Disable inlay hints global (Standard way)
vim.lsp.inlay_hint.enable(false)

-- DISABL AUTOFORMATTING (All languages)
vim.g.autoformat = false
vim.g.lazyvim_autoformat = false
