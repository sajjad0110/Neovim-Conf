-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Set the background to light (essential for the Latte flavor)
vim.opt.background = "light"
-- Set the default font for GUI nvim clients like neovide etc.
-- vim.o.guifont = "Comic Code:h11" -- tv sized font
-- vim.o.guifont = "TT2020 Style E:h14" -- As I'm using Tv as monitor
-- vim.o.guifont = "Agave Nerd Font:h14"
vim.o.guifont = "recursive mono casual static:h15"
-- vim.o.guifont = "rec mono casual:h14"

-- Set the line height
vim.o.linespace = 10 -- for comic code font
-- vim.o.linespace = 15 -- for TT2020 Style E font

-- Make line numbers default
-- vim.o.number = true -- Commenting it out because nvchad automatically has linenumbers enabled
-- Relative line numbers
vim.o.relativenumber = false
-- vim.o.numberwidth = 3

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 5

-- Set wordwrap to true
vim.opt.wrap = true
vim.opt.linebreak = true -- Prevents breaking in the middle of a word
vim.opt.breakindent = true -- Indents wrapped lines to match the start of the line

-- vim.opt.list = true
-- vim.opt.listchars = {
--  tab = "» ",     -- Shows '»' at the start of a tab
--  trail = "·",    -- Shows '·' for trailing spaces
--  nbsp = "␣",     -- Shows '␣' for non-breaking spaces
--  space = "·", -- UNCOMMENT THIS if you want a dot for EVERY space
-- }

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Size of an indent (when using >> or <<)
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing
vim.opt.expandtab = true -- Convert tabs to spaces (highly recommended for Python)
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Gemini way of getting similar feature to "scroll beyond last line"
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    if vim.g.center_enabled then
      local last_line = vim.fn.line("$")
      local curr_line = vim.fn.line(".")

      -- Only trigger if we are on the very last line
      if curr_line == last_line then
        vim.cmd("normal! zz")
      end
    end
  end,
})

-- Cursor Blinking settings...
-- 1. Define your cursor styles
-- n-v-c: Normal, Visual, Command-line (Block cursor)
-- i-ci-ve: Insert, Command-line Insert, Visual-exclude (Vertical bar)
-- blinkwait: Delay before blinking starts
-- blinkon/blinkoff: Duration of the blink phases

local active_cursor =
  "n-v-c:block-Cursor/lCursor-blinkwait700-blinkon500-blinkoff500,i-ci-ve:ver25-Cursor/lCursor-blinkwait300-blinkon600-blinkoff600,r-cr:hor20,o:hor50"
local inactive_cursor = "a:blinkon0" -- 'a' stands for all modes; blinkon0 disables blinking

-- Set the initial state
vim.opt.guicursor = active_cursor

-- 2. Handle Focus for Windows 10 / Neovide
-- This ensures the cursor stops blinking when you switch to another app
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  pattern = "*",
  callback = function()
    vim.opt.guicursor = active_cursor
  end,
})

vim.api.nvim_create_autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  callback = function()
    vim.opt.guicursor = inactive_cursor
  end,
})

if vim.g.neovide then
  vim.g.neovide_cursor_animation_length = 0.13 -- Default is 0.13, increase for "softer" movement
  vim.g.neovide_cursor_trail_size = 0.8
  vim.g.neovide_cursor_smooth_blink = true

  -- Progress bar settings
  vim.g.neovide_progress_bar_enabled = true -- enables the bar
  vim.g.neovide_progress_bar_height = 5.0 -- sets the height of bar
  vim.g.neovide_progress_bar_animation_speed = 200.0 -- speed
  vim.g.neovide_progress_bar_hide_delay = 2 -- sets the delay in seconds before the progress bar is hidden after reaching 100%

  -- Hiding the mouse as soon as you start typing
  -- moving the mouse makes it visible again
  vim.g.neovide_hide_mouse_when_typing = true

  -- Setting the refresh rate of the app
  vim.g.neovide_refresh_rate = 120

  -- Animate the cursor in insert mode
  vim.g.neovide_cursor_animate_in_insert_mode = true

  -- Specify cursor outline width while window is unfocused (in em)
  -- should be > 0 [=<0 == invisible].
  vim.g.neovide_cursor_unfocused_outline_width = 0.125

  vim.g.neovide_scroll_animation_length = 0.1

  -- Set padding
  vim.g.neovide_padding_top = 10
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 28
  vim.g.neovide_padding_left = 0

  -- Disable/enable Ligatures
  --vim.g.neovide_font_features = {
  --    ["Monaspace Argon NF"] = {
  --        "calt",     -- Texture Healing
  --        "liga",     -- Standard Ligatures
  --    },
  --    ["Monaspace Xenon NF"] = {
  --        "calt",
  --        "liga"
  --    },
  --}
end

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
