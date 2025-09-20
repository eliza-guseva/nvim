
-- leader
vim.g.mapleader = " "

local keymap = vim.keymap


keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
keymap.set('n', 'c', 'k', { desc = 'Move up' })
keymap.set('n', 'h', 'h', { desc = 'M<ScrollWheelDown>ove left' })  
keymap.set('n', 'n', 'l', { desc = 'Move right' })
keymap.set('n', 't', 'j', { desc = 'Move down' })

-- Visual mode navigation
keymap.set('v', 'c', 'k', { desc = 'Move up' })
keymap.set('v', 'h', 'h', { desc = 'Move left' })
keymap.set('v', 'n', 'l', { desc = 'Move right' })
keymap.set('v', 't', 'j', { desc = 'Move down' })

-- Relocated commands
keymap.set('n', 'j', 'n', { desc = 'Next search result' })
keymap.set('n', 'k', 'c', { desc = 'Change' })
keymap.set('n', 'l', 't', { desc = 'Till character' })

-- Visual mode for relocated commands
keymap.set('v', 'k', 'c', { desc = 'Change selection' })

keymap.set('o', 'c', 'k', { desc = 'Up motion' })
keymap.set('o', 'h', 'h', { desc = 'Left motion' })
keymap.set('o', 'n', 'l', { desc = 'Right motion' })
keymap.set('o', 't', 'j', { desc = 'Down motion' })
keymap.set('o', 'l', 't', { desc = 'Till motion' })


keymap.set('i', '<C-k>', function()
  vim.lsp.buf.signature_help()
end, { desc = "Show signature help", noremap = true })

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement


-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab

-- Supermaven keymaps
keymap.set({'n', 'i'}, '<C-s>', function()
  vim.cmd('SupermavenToggle')
end, { desc = "Toggle Supermaven" })

-- Supermaven command abbreviation
vim.cmd('cnoreabbrev St SupermavenToggle')

-- Buffer management
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete current buffer" })
keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>ba", "<cmd>%bdelete<CR>", { desc = "Delete all buffers" })
keymap.set("n", "<leader>bo", "<cmd>%bdelete|edit#|normal `\"<CR>", { desc = "Delete all other buffers" })

-- LSP additional commands
keymap.set("n", "<leader>bf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format buffer" })
keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })

-- Copy operations
keymap.set("n", "<leader>cf", function()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath)
  print("Copied file path: " .. filepath)
end, { desc = "Copy current file path" })

keymap.set("n", "<leader>cw", function()
  local word = vim.fn.expand("<cword>")
  vim.fn.setreg("+", word)
  print("Copied word: " .. word)
end, { desc = "Copy word under cursor" })

-- Disable F1 help key
keymap.set({"n", "i", "v"}, "<F1>", "<nop>", { desc = "Disabled F1 help" })
