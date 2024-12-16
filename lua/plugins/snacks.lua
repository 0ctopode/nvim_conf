return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
  	  notifier = {
      -- your notifier configuration comes here
      -- or leave it empty to use the default settings
        timeout = 5000, -- default timeout in ms
    }
  },
}
