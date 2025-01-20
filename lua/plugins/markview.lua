return {
    "OXY2DEV/markview.nvim",
    -- branch = "dev",
    -- lazy = false,      -- Recommended
    -- You can't tell me what to do
    ft = "markdown", -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
    	    code_blocks = {
    	    	    -- Code blocks look cooked with word wrap
    	    	    enable = false,
    	    },
    },
}
