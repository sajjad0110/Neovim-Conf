return {
    { -- monokai-pro theme
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("monokai-pro").setup({
                -- Basic settings
                transparent_background = false,
                terminal_colors = true,
                devicons = true,

                -- Syntax highlighting styles
                styles = {
                    comment = { italic = false },
                    keyword = { italic = false },
                    type = { italic = false },
                    storageclass = { italic = false },
                    structure = { italic = false },
                    parameter = { italic = false },
                    annotation = { italic = false },
                    tag_attribute = { italic = false },
                },

                -- Treesitter settings
                treesitter = {
                    italic = false,
                },

                -- Filter selection (default: classic for dark, light for light background)
                filter = "light", -- classic | light | machine | octagon | pro | ristretto | spectrum

                -- Day/night mode
                day_night = {
                    enable = false,
                    day_filter = "pro",
                    night_filter = "spectrum",
                },

                -- Incremental search style
                inc_search = "background", -- underline | background

                -- Background clearing for floating windows
                background_clear = {
                    "toggleterm",
                    "telescope",
                    "renamer",
                    "notify",
                },

                -- Plugin-specific settings
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                        underline_fill = false,
                        bold = true,
                    },
                    indent_blankline = {
                        context_highlight = "pro", -- default | pro
                        context_start_underline = false,
                    },
                },
            })
            vim.cmd.colorscheme("monokai-pro")
        end,
    },

    {
        "sainnhe/sonokai",
        lazy = true,
        priority = 1000,
        config = function()
            -- optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            vim.g.sonokai_style = "maia" -- default | atlantis | andromeda | shusia | maia | espresso
            --------------------------------------------------------------------------
            -- enable or disable italic style in comment
            vim.g.sonokai_disable_italic_comment = 1
            -- enable[1]/disable[0] italic in the colorscheme
            vim.g.sonokai_enable_italic = 0
            -- customize the cursor color (requires setting |guicursor|)
            vim.g.sonokai_cursor = "auto" -- auto | red | orange | yellow | green | blue | purple
            -- to use transarent background, set this option to 1
            -- if you want more ui components to be transparent,
            -- (e.g. status line bg), set this option to 2 (default 0)
            vim.g.sonokai_transparent_background = 0
            -- dim inactive windows (default 0)
            vim.g.sonokai_dim_inactive_windows = 1
            -- Customize the background color of |hl-PmenuSel| and |hl-WildMenu|
            vim.g.sonokai_menu_selection_background = "blue" -- [blue] | green | red
            -- By default, this color scheme won't color the foreground of |spell|,
            -- instead colored under curls will be used. If you also want to color
            -- the foreground, set this option to `'colored'`.
            vim.g.sonokai_spell_foreground = "none" -- [none] | colored
            -- whether to show |hl-EndofBuffer| (default 1)
            vim.g.sonokai_show_eob = 1
            -- Style used to make Neovim's floating windows stand out from other windows
            -- 'bright' = makes the bg of these windows lighter than |hl-Normal|
            -- 'dim' = makes it darker
            -- 'blend' = same bg as normal windows
            vim.g.sonokai_float_style = "bright"
            -- highlight the background of error/warning/info/hint texts (default 0)
            vim.g.sonokai_diagnostic_text_highlight = 1
            -- highlighting error/warning/info/hint lines (default 0)
            vim.g.sonokai_diagnostic_line_highlight = 1
            -- adjust the way virtual texts are highlighted
            vim.g.sonokai_diagnostic_virtual_text = "grey" -- grey | colored | highlighted
            -- Some plugins can highlight the word under current cursor, you can use
            -- this option to control their behavior
            -- [grey background] | high contrast background | bold | underline | italic
            vim.g.sonokai_current_word = "grey background"
            -- Inlay hints are special markers that are displayed inline with the code
            -- to provide you with additional information. You can use this option to
            -- customize the background color of inlay hints.
            vim.g.sonokai_inlay_hints_background = "none" -- [none] | dimmed
            -- Setting this option to `1` will disable terminal colors provided by this
            -- colorscheme so you can remain terminal colors the same when
            -- using |:terminal| in vim and outside of vim. (default 0)
            vim.g.sonokai_disable_terminal_colors = 0
            -- By default, bold is enabled in lightline color scheme. To disable
            -- bold in lightline color scheme, set this option to `1`.
            vim.g.sonokai_lightline_disable_bold = 0
            -- increasing the performance of the colorscheme loading (default 0)
            vim.g.sonokai_better_performance = 1
            -- override color palette
            -- vim.g.sonokai_colors_override = {}
            --------------------------------------------------------------------------
            -- vim.cmd.colorscheme("sonokai")
        end,
    },

    -- kanagawa theme
    {
        "rebelot/kanagawa.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            -- Default options:
            require("kanagawa").setup({
                compile = false, -- enable compiling the colorscheme
                undercurl = true, -- enable undercurls
                commentStyle = { italic = false },
                functionStyle = {},
                keywordStyle = { italic = false },
                statementStyle = { bold = true },
                typeStyle = {},
                transparent = false, -- do not set background color
                dimInactive = false, -- dim inactive window `:h hl-NormalNC`
                terminalColors = true, -- define vim.g.terminal_color_{0,17}
                theme = "lotus", -- lotus | dragon | wave
            })
            -- vim.cmd.colorscheme("kanagawa-lotus")
        end,
    },

    -- nightfox theme
    {
        "EdenEast/nightfox.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            require("nightfox").setup({})
            -- vim.cmd.colorscheme("dawnfox") -- nightfox | dayfox | dawnfox | duskfox | nordfox | terafox | carbonfox
        end,
    },

    -- catpuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000, -- Ensures the theme loads before other plugins
        config = function()
            require("catppuccin").setup({
                flavour = "latte", -- auto | latte | frappe | macchiato | mocha
                no_italic = true,
                term_colors = true, -- sets terminal colors
                styles = {},
                lsp_styles = {},
            })
            -- vim.cmd.colorscheme("catppuccin")
        end,
    },

    -- Github theme
    {
        "projekt0n/github-nvim-theme",
        name = "github-theme",
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require("github-theme").setup({
                -- ...
            })

            -- vim.cmd("colorscheme github_light")
        end,
    },
}
