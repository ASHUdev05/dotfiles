return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    require('nvim-treesitter').install {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "html",
        "css",
        "java",
        "json",
        "tsx", 
        "python", 
        "go", 
        "c_sharp",
        "c",
        "cpp",
        "rust",
    }
  end,
}