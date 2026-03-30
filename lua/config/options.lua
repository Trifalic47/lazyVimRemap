-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Performance tweaks for "smoothness"
vim.o.updatetime = 100
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 0
vim.o.shada = "!,'100,<50,s10,h" -- Limit ShaDa size
vim.o.swapfile = false
vim.o.undofile = true
vim.o.lazyredraw = true -- Don't redraw while executing macros
vim.o.redrawtime = 1500
vim.o.signcolumn = "yes"
vim.o.scrolloff = 8

-- Smoothness: Fix potential lag from clipboard on Linux
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

-- Block cursor in all modes
vim.opt.guicursor = "n-v-c-i-ci-ve:block"

-- Disable netrw for Oil
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
