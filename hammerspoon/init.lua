hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello Nancy"}):send()
end)

-- hotkey mash
local mash   = {"ctrl", "cmd"}
local mash_app   = {"cmd", "alt", "ctrl", "shift"}
local mash_shift = {"ctrl", "cmd", "shift"}

-- disable animation
hs.window.animationDuration = 0

-- Reload config
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

-- Window Hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

hs.hotkey.bind(mash_app, 'W', function () hs.application.launchOrFocus("Dictionary") end)
