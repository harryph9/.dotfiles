vim.g.mapleader = " "

local map = vim.keymap
local opt = { silent = true }

map.set("n", "+", "<C-a>")
map.set("n", "-", "<C-x>")

-- map.set('n', '<C-a>', 'gg<S-v>G')

map.set("n", "sv", "<C-w>v")
map.set("n", "sh", "<C-w>s")
map.set("n", "se", "<C-w>=")
map.set("n", "sx", ":close<CR>", opt)

map.set("n", "te", ":tabnew<CR>", opt)
map.set("n", "tc", ":tabclose<CR>", opt)
map.set("n", "tn", ":tabn<CR>", opt)
map.set("n", "tp", ":tabp<CR>", opt)

map.set("n", "<C-n>", ":Neotree toggle<CR>", opt)
map.set("n", "<C-f>", ":Neotree focus<CR>", opt)

map.set("n", "ff", "<cmd>Telescope find_files<cr>", opt)
map.set("n", "fs", "<cmd>Telescope live_grep<cr>", opt)
map.set("n", "fc", "<cmd>Telescope grep_string<cr>", opt)
map.set("n", "fb", "<cmd>Telescope buffers<cr>", otp)

map.set("n", "gc", "<cmd>Telescope git_commits<cr>", opt)
map.set("n", "gb", "<cmd>Telescope git_branches<cr>", opt)
map.set("n", "gs", "<cmd>Telescope git_status<cr>", opt)

map.set("n", "<Up>", "<nop>")
map.set("n", "<Down>", "<nop>")
map.set("n", "<Right>", "<nop>")
map.set("n", "<Left>", "<nop>")
