-- Bootstrap lazy.nvim
-- require("lazy-bootstrap")
require("eliza.core.options")
require("eliza.core.keymaps")
require("eliza.lazy")
require("eliza.plugins")

vim.cmd('colorscheme unokai')


vim.cmd('cnoreabbrev St SupermavenToggle')
vim.keymap.set({'n', 'i'}, '<C-s>', function()
  vim.cmd('SupermavenToggle')
end)


-- Stuff
vim.g.mapleader = " "
vim.opt.number = true

-- Setup lazy.nvim
-- require("lazy").setup({
--   -- LSP Support
--   {
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--     },
--     config = function()
--       -- Setup Mason (LSP installer)
--       require("mason").setup()
--       require("mason-lspconfig").setup({
--         ensure_installed = { "pyright", "html", "eslint" }, -- <<< LSPs are added here
--         automatic_installation = true,
--       })
--
--       -- Setup LSP
--       local lspconfig = require("lspconfig")
--
--       -- Python LSP setup
--       lspconfig.pyright.setup({
--         settings = {
--           python = {
--             analysis = {
--               typeCheckingMode = "basic"
--             }
--           }
--         }
--       })
--
--       lspconfig.gopls.setup({
--         settings = {
--           gopls = {
--             analyses = {
--               unusedparams = true,
--             },
--             staticcheck = true,
--             gofumpt = true,
--           },
--         },
--       })
--
--       -- Key mappings for LSP
--       vim.api.nvim_create_autocmd('LspAttach', {
--         callback = function(args)
--           local opts = { buffer = args.buf }
--           vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
--           vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
--           vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
--           vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
--         end,
--       })
--       -- HTML
--       lspconfig.html.setup({})
--
--       -- JavaScript/TypeScript
--       lspconfig.quick_lint_js.setup({})
--
--       -- ESLint
--       lspconfig.eslint.setup({})
--     end
--     },
--
-- {
--   "supermaven-inc/supermaven-nvim",
--   config = function()
--     require("supermaven-nvim").setup({
--         keymaps = {
--             accept_suggestion = "<S-CR>",
--             clear_suggestion = "<C-]>",
--             accept_word = "<C-h>",
--
--       },
--       ignore_filetypes = { cpp = true }, -- or { "cpp", }
--       color = {
--         suggestion_color = "#aaaaaa",
--         cterm = 244,
--       },
--     })
--   end,
-- }
-- })
