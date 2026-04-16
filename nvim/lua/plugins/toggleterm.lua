return {
  {
    "akinsho/toggleterm.nvim",
    version = "*", -- Use the latest version
    config = true, -- This runs the default setup function
    cmd = "ToggleTerm", -- Enables the :ToggleTerm command
    keys = {
      -- {
      --   "<C-/>",
      --   ":ToggleTerm dir=%:p:h<CR>",
      --   desc = "Toggle floating terminal",
      -- },
      -- Add more custom keymaps if needed, for example:
      -- { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Open vertical terminal" },
      -- { "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Open horizontal terminal" },
    },
    opts = {
      size = 20,
      direction = "float", -- Opens as a floating window by default
      shade_filetypes = {},
      hide_numbers = true,
      insert_mappings = true,
      terminal_mappings = true,
      start_in_insert = true,
      close_on_exit = true,
      -- autochdir = true,
    },
  },
}
