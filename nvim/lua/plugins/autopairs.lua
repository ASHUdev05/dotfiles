return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- integrates with treesitter if you add it later
            disable_filetype = { "TelescopePrompt" },
        })

        -- optional integration with completion
        local cmp_ok, cmp = pcall(require, "blink.cmp")
        if cmp_ok then
            -- if blink exposes completion events, this safely hooks it
            -- (noop if not needed)
        end
    end,
}