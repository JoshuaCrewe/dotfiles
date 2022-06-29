-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/joshua/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/joshua/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/joshua/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/joshua/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/joshua/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["html5.vim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/html5.vim",
    url = "https://github.com/othree/html5.vim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["nvim-comment"] = {
    config = { 'require("config/nvim-comment")' },
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/nvim-comment",
    url = "https://github.com/terrortylor/nvim-comment"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["php.vim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/php.vim",
    url = "https://github.com/StanAngeloff/php.vim"
  },
  playground = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["scss-syntax.vim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/scss-syntax.vim",
    url = "https://github.com/cakebaker/scss-syntax.vim"
  },
  ["seoul256.vim"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/seoul256.vim",
    url = "https://github.com/junegunn/seoul256.vim"
  },
  ["telescope.nvim"] = {
    config = { 'require("config/telescope")' },
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-blade"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-blade",
    url = "https://github.com/jwalton512/vim-blade"
  },
  ["vim-javascript"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-javascript",
    url = "https://github.com/pangloss/vim-javascript"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-ragtag",
    url = "https://github.com/tpope/vim-ragtag"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-svelte"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-svelte",
    url = "https://github.com/evanleck/vim-svelte"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator",
    url = "https://github.com/christoomey/vim-tmux-navigator"
  },
  ["vim-twig"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-twig",
    url = "https://github.com/lumiliet/vim-twig"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/vim-vinegar",
    url = "https://github.com/tpope/vim-vinegar"
  },
  ["zen-mode.nvim"] = {
    config = { 'require("config/zen-mode")' },
    loaded = true,
    path = "/home/joshua/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-comment
time([[Config for nvim-comment]], true)
require("config/nvim-comment")
time([[Config for nvim-comment]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require("config/telescope")
time([[Config for telescope.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
require("config/zen-mode")
time([[Config for zen-mode.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
