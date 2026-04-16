-- Only do this if you still see two notifications!
return {
  "folke/noice.nvim",
  opts = {
    lsp = {
      progress = {
        enabled = false, -- This turns off the Noice version of the bar
      },
    },
  },
}