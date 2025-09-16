return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "christoomey/vim-tmux-navigator", -- tmux & split window navigation
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "tssm/fairyfloss.vim",
    priority = 1000,
    name = "fairyfloss",
    config = function ()
        local function set_colorscheme_by_background()
            if vim.o.background == "light" then
                vim.cmd("colorscheme fairyfloss")
            else
                vim.cmd("colorscheme unokai")
            end
        end

        -- Set initial colorscheme
        set_colorscheme_by_background()

        -- Listen for background changes
        vim.api.nvim_create_autocmd("OptionSet", {
            pattern = "background",
            callback = set_colorscheme_by_background,
        })

    end
  },
}
