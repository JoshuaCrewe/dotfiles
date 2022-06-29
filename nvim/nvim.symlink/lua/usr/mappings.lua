-- Modes
--   normal_mode = "n"
--   insert_mode = "i"
--   visual_mode = "v"
--   visual_block_mode = "x"
--   term_mode = "t"
--   command_mode = "c"

map("", "<Space>", "<Nop>")                   -- map Space to a no-op
g.mapleader = ' '                             -- space for leader
g.maplocalleader = ' '                        -- space for local leader too

g.netrw_liststyle = 3

map("n", "<CR>", ":Telescope find_files<CR>")
map("n", "<leader><CR>", ":Telescope live_grep<CR>")

map("n", "<leader><leader>", "<c-^>")

map("n", "<leader>y", "\"+yy")
map("v", "<leader>y", "\"+yy")

map('n', '<leader>tsh', ':TSHighlightCapturesUnderCursor<CR>')
