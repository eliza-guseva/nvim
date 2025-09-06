return {
    "supermaven-inc/supermaven-nvim",
    config = function()
        require("supermaven-nvim").setup({
            keymaps = {
                accept_suggestion = "<C-y>",
                clear_suggestion = "<C-]>",
                accept_word = "<C-h>",
            },
            ignore_filetypes = { cpp = true },
            color = {
                suggestion_color = "#aaaaaa",
                cterm = 244,
            },
        })
    end,
}