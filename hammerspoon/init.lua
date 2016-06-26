hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  hs.notify.new({title="Hammerspoon", informativeText="Hello Nancy"}):send()
end)

-- hotkey mash
local mash   = {"ctrl", "cmd"}
local mash_app   = {"cmd", "alt", "ctrl", "shift"}
local mash_shift = {"ctrl", "cmd", "shift"}

-- disable animation
hs.window.animationDuration = 0

-- Window Hints
hs.hotkey.bind(mash, '.', hs.hints.windowHints)

hs.hotkey.bind(mash_app, 'W', function () hs.application.launchOrFocus("Dictionary") end)

-- Reload config
hs.hotkey.bind(mash, "R", function()
  hs.reload()
end)

-- watch config for changes and reload when they occur
function reloadConfig(files)  
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()  
-- hs.alert.show("Config reloaded")  
