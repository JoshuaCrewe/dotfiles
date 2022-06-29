-- Indentation
opt.autoindent = true                  -- Yes, please
opt.expandtab = true                   -- Use spaces instead of tabs
opt.smarttab = true
opt.shiftround = true                  -- Round indent
opt.smartindent = true                 -- Insert indents automatically

-- Tabs
opt.tabstop = 4                        -- Number of spaces tabs count for
opt.softtabstop = 4
opt.shiftwidth = 4                     -- Size of an indent

-- Extra files
opt.backup = false
opt.swapfile = false
opt.writebackup = false

-- Gutter Numbers
opt.number = true
opt.rnu = true
opt.wrap = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Persistent Undo
opt.undodir = os.getenv( "HOME" ) .. '/.local/share/nvim/undo'
opt.undofile = true

opt.cursorline = true
