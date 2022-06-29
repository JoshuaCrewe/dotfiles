-- opt.termguicolors = true
opt.background = 'dark'
g.seoul256_background = 233

local colorscheme = "seoul256"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found.")
  return
end

-- plugin/telescope.lua:11
cmd[[highlight TelescopeSelection ctermbg=234]]
cmd[[highlight TelescopeMatching  ctermbg=237]]
