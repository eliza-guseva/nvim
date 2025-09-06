return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = true,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
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

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
        -- Force override the 'c' mapping with your movement
    keymap.set('n', 'c', 'k', { buffer = bufnr, desc = 'Move up', noremap = true, silent = true })
    keymap.set('n', 'h', 'h', { buffer = bufnr, desc = 'Move left', noremap = true, silent = true })
    keymap.set('n', 'n', 'l', { buffer = bufnr, desc = 'Move right', noremap = true, silent = true })
    keymap.set('n', 't', 'j', { buffer = bufnr, desc = 'Move down', noremap = true, silent = true })

    keymap.set("n", "C", "c", { buffer = bufnr })

    keymap.set("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>tc", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>tr", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end
}

