return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add          = { text = "┃" },
                change       = { text = "┃" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
            },

            signs_staged_enable = true,
            signcolumn = true,

            -- Performance-safe defaults
            watch_gitdir = {
                follow_files = true,
            },

            auto_attach = true,

            current_line_blame = false, -- keep OFF by default

            preview_config = {
                style = "minimal",
                relative = "cursor",
                row = 0,
                col = 1,
            },
        })

        local gs = require("gitsigns")

        vim.keymap.set("n", "]h", gs.next_hunk, { desc = "Next hunk" })
        vim.keymap.set("n", "[h", gs.prev_hunk, { desc = "Prev hunk" })

        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })

        vim.keymap.set("n", "<leader>hb", gs.blame_line, { desc = "Blame line" })
        vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
    end,
}