-- Packer plugin manager
-- https://github.com/zanshin/dotfiles/blob/master/nvim/lua/usr/plugins.lua

-- helper function for plugin configurations
local function get_config(name)
    return string.format("require(\"config/%s\")", name)
end

-- Automatically install packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path,
    }
    print "Installing Packer, close and reopen Neovim."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim when the plugins.lua file is saved
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer require failed.")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

return packer.startup(function(use)
    --
    --  Use Packer to manage itself
    use { 'wbthomason/packer.nvim' }
    use {
        'rktjmp/lush.nvim'
    }
    -- use { '~/code/seoul256' }
    use { 'junegunn/seoul256.vim' }

    -- Would be good to replace these with treesitter?
    use { 'cakebaker/scss-syntax.vim'  }
    use { 'pangloss/vim-javascript' }
    use { 'othree/html5.vim' }
    use { 'StanAngeloff/php.vim' }
    use { 'lumiliet/vim-twig' }
    use { 'jwalton512/vim-blade' }
    use { 'evanleck/vim-svelte' }



    use { 'christoomey/vim-tmux-navigator' }
    use { 'tpope/vim-vinegar' }
    use {
        'terrortylor/nvim-comment',
        config = get_config("nvim-comment")
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        config = get_config("telescope")
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }


    use { 'tpope/vim-surround' } -- Surrounding text motion
    use { 'tpope/vim-unimpaired' } -- Some extra shortcuts for useful tasks
    use { 'tpope/vim-ragtag' } -- Some extra mappings

    
    use { 
        'folke/zen-mode.nvim',
        config = get_config("zen-mode")
    }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
