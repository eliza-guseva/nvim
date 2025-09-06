-- Bootstrap lazy.nvim
require("lazy-bootstrap")


-- Python indentation settings
vim.opt.tabstop = 4      -- How many spaces a tab character shows as
vim.opt.shiftwidth = 4   -- How many spaces for auto-indent
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.softtabstop = 4  -- How many spaces when you press Tab
vim.cmd('syntax on')
vim.opt.foldmethod = 'indent'
-- leader
vim.g.mapleader = " "
-- autosave
vim.api.nvim_create_autocmd("FocusLost", {
  command = "silent! wa"  -- Save all files when you switch away from Neovim
})

vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set('n', 'c', 'k', { desc = 'Move up' })
vim.keymap.set('n', 'h', 'h', { desc = 'M<ScrollWheelDown>ove left' })  
vim.keymap.set('n', 'n', 'l', { desc = 'Move right' })
vim.keymap.set('n', 't', 'j', { desc = 'Move down' })

-- Visual mode navigation
vim.keymap.set('v', 'c', 'k', { desc = 'Move up' })
vim.keymap.set('v', 'h', 'h', { desc = 'Move left' })
vim.keymap.set('v', 'n', 'l', { desc = 'Move right' })
vim.keymap.set('v', 't', 'j', { desc = 'Move down' })

-- Relocated commands
vim.keymap.set('n', 'j', 'n', { desc = 'Next search result' })
vim.keymap.set('n', 'k', 'c', { desc = 'Change' })
vim.keymap.set('n', 'l', 't', { desc = 'Till character' })

-- Visual mode for relocated commands
vim.keymap.set('v', 'k', 'c', { desc = 'Change selection' })

vim.keymap.set('o', 'c', 'k', { desc = 'Up motion' })
vim.keymap.set('o', 'h', 'h', { desc = 'Left motion' })
vim.keymap.set('o', 'n', 'l', { desc = 'Right motion' })
vim.keymap.set('o', 't', 'j', { desc = 'Down motion' })
vim.keymap.set('o', 'l', 't', { desc = 'Till motion' })


vim.keymap.set('i', '<C-k>', function()
  vim.lsp.buf.signature_help()
end, { desc = "Show signature help", noremap = true })

vim.cmd('cnoreabbrev tt NvimTreeToggle')
vim.cmd('cnoreabbrev tfc NvimTreeFocus')
vim.cmd('cnoreabbrev St SupermavenToggle')
vim.keymap.set({'n', 'i'}, '<C-s>', function()
  vim.cmd('SupermavenToggle')
end)


-- Stuff
vim.g.mapleader = " "
vim.opt.number = true

-- Setup lazy.nvim
require("lazy").setup({
  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Setup Mason (LSP installer)
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "html", "eslint" }, -- <<< LSPs are added here
        automatic_installation = true,
      })

      -- Setup LSP
      local lspconfig = require("lspconfig")
      
      -- Python LSP setup
      lspconfig.pyright.setup({
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic"
            }
          }
        }
      })

      lspconfig.gopls.setup({
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })

      -- Key mappings for LSP
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        end,
      })
      -- HTML
      lspconfig.html.setup({})

      -- JavaScript/TypeScript
      lspconfig.quick_lint_js.setup({})

      -- ESLint
      lspconfig.eslint.setup({})
    end
  },
-- new syntax highlighting
{
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = { "dart" },
      auto_install = true,
      highlight = {
        enable = true,
        -- Add this to prevent the error
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    }
  end,
},

{
  "akinsho/git-conflict.nvim",
  version = "*",
  config = function()
    require('git-conflict').setup()
  end
},
	
  -- Telescope
  {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('telescope').setup()
        -- Key mappings
        vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
        vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
        vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
        vim.keymap.set('n', '<leader>/', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
        vim.keymap.set('n', '<leader>fd', function() require('telescope.builtin').live_grep({cwd = vim.fn.expand('%:p:h')}) end)
      end
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<F1>'] = cmp.mapping.abort(),
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        }),
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    config = function()
      require("flutter-tools").setup({})
    end,
  },
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- For file icons
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        on_attach = function(bufnr)
          local api = require('nvim-tree.api')
          -- Default mappings
          vim.keymap.set('n', '<CR>', api.node.open.edit, { buffer = bufnr, desc = 'Open' })
          vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, { buffer = bufnr })
          vim.keymap.set('n', 'o', api.node.open.edit, { buffer = bufnr, desc = 'Open' })
          vim.keymap.set('n', 'r', api.fs.rename, { buffer = bufnr, desc = 'Rename' })
          vim.keymap.set('n', 'd', api.fs.remove, { buffer = bufnr, desc = 'Delete' })
          vim.keymap.set('n', 'a', api.fs.create, { buffer = bufnr, desc = 'Create' })
            vim.keymap.set('n', 'c', 'k', { buffer = bufnr, desc = 'Move up' })
            end,
          })

end,
  },
  {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<S-CR>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-h>",
                
          },
          ignore_filetypes = { cpp = true }, -- or { "cpp", }
          color = {
            suggestion_color = "#aaaaaa",
            cterm = 244,
          },
        })
      end,

    },

})
-- Dart-specific settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "dart",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})
