-- Bootstrap lazy.nvim
-- require("lazy-bootstrap")
require("eliza.core.options")
require("eliza.core.keymaps")
require("eliza.lazy")
require("eliza.plugins")

vim.cmd('colorscheme unokai')

-- Fix cursor color for morning colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "morning",
  callback = function()
    vim.cmd("highlight Cursor guibg=#000000 guifg=NONE")
    vim.cmd("highlight CursorLine guibg=#f5f5f5")
  end,
})

