local opt = vim.opt 
-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor li:ne (when relative number is on)


-- Python indentation settings
opt.tabstop = 4      -- How many spaces a tab character shows as
opt.shiftwidth = 4   -- How many spaces for auto-indent
opt.expandtab = true -- Convert tabs to spaces
opt.softtabstop = 4  -- How many spaces when you press Tab
vim.cmd('syntax on')
opt.foldmethod = 'indent'
-- autosave
vim.api.nvim_create_autocmd("FocusLost", {
  command = "silent! wa"  -- Save all files when you switch away from Neovim
})

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

opt.termguicolors = true
opt.signcolumn = "yes"

-- line wrapping
opt.wrap = true -- line wrapping
