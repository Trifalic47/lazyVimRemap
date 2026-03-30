-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

-- Disable some LazyVim defaults that conflict with the custom ones
local function unmap(mode, lh)
    pcall(vim.keymap.del, mode, lh)
end

-- Clear common conflict keys before mapping
unmap("n", "<leader>s")
unmap("n", "<leader>f")
unmap("n", "<leader>e")
unmap("n", "<leader>p")
unmap("n", "<leader>w")
unmap("n", "<leader>c")
unmap("n", "<C-f>")

-- REMAP.LUA INTEGRATION (Exact same)
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set("v", "\\", "gc", { remap = true, desc = "Comment selected text" })
vim.keymap.set("n", "\\", "gcc", { remap = true, desc = "Comment current line" })

vim.api.nvim_set_keymap("n", "<leader>tf", "<Plug>PlenaryTestFile", { noremap = false, silent = false })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "=ap", "ma=ap'a")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

-- Paste over without yanking
vim.keymap.set("v", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<M-H>", "<cmd>silent !tmux neww tmux-sessionizer -s 0<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>r", [[:s/\<<C-r><C-w>\>/]], { desc = "Replace word instance" })
vim.keymap.set("n", "<leader>rw", "ciw", { desc = "Change current word" })
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>lt", function()
    vim.cmd [[ PlenaryBustedFile % ]]
end)

-- Go / C error handling shortcuts
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a")
vim.keymap.set("n", "<leader>ef", "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"error: %s\\n\", err.Error())<Esc>jj")
vim.keymap.set("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i")

vim.keymap.set("n", "<leader>ca", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

-- Harpoon keymaps
vim.keymap.set("n", "<leader>a", function() require("harpoon"):list():add() end)
vim.keymap.set("n", "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)

vim.keymap.set("n", "<M-1>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<M-2>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<M-3>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<M-4>", function() require("harpoon"):list():select(4) end)

vim.keymap.set("n", "<M-CR>", function()
    -- Try gf (go to file) first for includes like <stdio.h>
    local success, _ = pcall(vim.cmd, "normal! gf")
    if success then return end

    -- If gf fails, try LSP definition for functions
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
        vim.lsp.buf.definition()
    else
        print("No file or definition found under cursor")
    end
end, { desc = "Smart open function or file" })

vim.keymap.set("n", "<M-h>", "<C-o>", { desc = "Jump back" })
vim.keymap.set("n", "<M-l>", "<C-i>", { desc = "Jump forward" })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Window Management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom split" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top split" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right split" })

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- Move window in direction (Shift + Move keys)
vim.keymap.set("n", "<C-w><S-h>", "<C-w>H")
vim.keymap.set("n", "<C-w><S-j>", "<C-w>J")
vim.keymap.set("n", "<C-w><S-k>", "<C-w>K")
vim.keymap.set("n", "<C-w><S-l>", "<C-w>L")

-- Telescope mappings
vim.keymap.set('n', '<leader>pf', function() require('telescope.builtin').find_files() end, {})
vim.keymap.set('n', '<C-p>', function() require('telescope.builtin').git_files() end, {})
vim.keymap.set('n', '<leader>pws', function()
    local word = vim.fn.expand("<cword>")
    require('telescope.builtin').grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pWs', function()
    local word = vim.fn.expand("<cWORD>")
    require('telescope.builtin').grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>ps', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', function() require('telescope.builtin').help_tags() end, {})
