require("zen-mode").setup {
    window = {
        width = .5, -- width will be 85% of the editor width
        options = {
            -- signcolumn = "no", -- disable signcolumn
            number = false, -- disable number column
            relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
        },
        plugins = {
            -- disable some global vim options (vim.o...)
            -- comment the lines to not apply the options
            options = {
                enabled = true,
                -- ruler = false, -- disables the ruler text in the cmd line area
                -- showcmd = false, -- disables the command in the last line of the screen
            },
            -- twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
            -- gitsigns = { enabled = false }, -- disables git signs
            tmux = { enabled = false }, -- disables the tmux statusline
            -- this will change the font size on kitty when in zen mode
            -- to make this work, you need to set the following kitty options:
            -- - allow_remote_control socket-only
            -- - listen_on unix:/tmp/kitty
            -- kitty = {
                -- enabled = false,
                -- font = "+4", -- font size increment
            -- },
        },
    }
}
