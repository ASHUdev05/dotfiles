return {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000,
    config = function()
        -- Options should be set before loading the colorscheme
        vim.g.gruvbox_material_background = 'soft' -- 'hard', 'medium', 'soft'
        vim.g.gruvbox_material_better_performance = 1
        vim.cmd.colorscheme('gruvbox-material')
    end
}