hs.hotkey.bind({"cmd", "alt", "ctrl"}, "W", function()
  -- hs.notify.new({title="Hammerspoon", informativeText="Hello Luke"}):send()
end)

-- Capture the hostname, so we can make this config behave differently across my Macs
hostname = hs.host.localizedName()

-- hotkey mash
local mash   = {"ctrl", "cmd"}
local mash_app   = {"cmd", "alt", "ctrl", "shift"}
local mash_shift = {"ctrl", "cmd", "shift"}

-- disable animation
hs.window.animationDuration = 0

function bindKey(key, fn)
  hs.hotkey.bind(mash, key, fn)
end

positions = {
  maximized ={x=0, y=0, w=1, h=1},
  centered = {x=0.17, y=0.08, w=0.66, h=0.85},
  center = {x=0.1, y=0.05, w=0.77, h=0.88},

  left34 = {x=0, y=0, w=0.34, h=1},
  left50 = hs.layout.left50,
  left66 = {x=0, y=0, w=0.66, h=1},
  left70 = hs.layout.left70,

  right30 = hs.layout.right30,
  right34 = {x=0.66, y=0, w=0.34, h=1},
  right50 = hs.layout.right50,
  right66 = {x=0.34, y=0, w=0.66, h=1},

  upper50 = {x=0, y=0, w=1, h=0.5},
  upper50Left50 = {x=0, y=0, w=0.5, h=0.5},
  upper50Right15 = {x=0.85, y=0, w=0.15, h=0.5},
  upper50Right30 = {x=0.7, y=0, w=0.3, h=0.5},
  upper50Right50 = {x=0.5, y=0, w=0.5, h=0.5},

  lower50 = {x=0, y=0.5, w=1, h=0.5},
  lower50Left50 = {x=0, y=0.5, w=0.5, h=0.5},
  lower50Right50 = {x=0.5, y=0.5, w=0.5, h=0.5},

  chat = {x=0.5, y=0, w=0.35, h=0.5}
}

-- Grid

grid = {
  {key="u", units={positions.upper50Left50}},
  {key="i", units={positions.upper50}},
  {key="o", units={positions.upper50Right50}},

  {key="j", units={positions.left50, positions.left66, positions.left34}},
  {key="k", units={positions.centered, positions.center, positions.maximized}},
  {key="l", units={positions.right50, positions.right66, positions.right34}},

  {key="m", units={positions.lower50Left50}},
  {key=",", units={positions.lower50}},
  {key=".", units={positions.lower50Right50}},

  {key="f", units={positions.maximized}},
}

hs.fnutils.each(grid, function(entry)
  bindKey(entry.key, function()
    local units = entry.units
    local screen = hs.screen.mainScreen()
    local window = hs.window.focusedWindow()
    local windowGeo = window:frame()

    local index = 0
    hs.fnutils.find(units, function(unit)
      index = index + 1

      local geo = hs.geometry.new(unit):fromUnitRect(screen:frame()):floor()
      return windowGeo:equals(geo)
    end)
    if index == #units then index = 0 end

    currentLayout = null
    window:moveToUnit(units[index + 1])
  end)
end)

-- Window Hints
hs.hotkey.bind(mash_shift, '/', hs.hints.windowHints)

-- App Launching
hs.hotkey.bind(mash_app, 'J', function () hs.application.launchOrFocus("iTerm") end)
hs.hotkey.bind(mash_app, 'K', function () hs.application.launchOrFocus("Firefox") end)
hs.hotkey.bind(mash_app, 'S', function () hs.application.launchOrFocus("Slack") end)
hs.hotkey.bind(mash_app, 'T', function () hs.application.launchOrFocus("Transmit") end)
hs.hotkey.bind(mash_app, 'L', function () hs.application.launchOrFocus("Messages") end)
hs.hotkey.bind(mash_app, 'M', function () hs.application.launchOrFocus("Mail") end)
hs.hotkey.bind(mash_app, 'I', function () hs.application.launchOrFocus("Adobe Illustrator") end)
hs.hotkey.bind(mash_app, 'G', function () hs.application.launchOrFocus("Tower") end)
hs.hotkey.bind(mash_app, 'P', function () hs.application.launchOrFocus("Spotify") end)
hs.hotkey.bind(mash_app, 'H', function () hs.application.launchOrFocus("Harvest") end)
hs.hotkey.bind(mash_app, 'C', function () hs.application.launchOrFocus("Google Chrome") end)

--Layouts
hs.hotkey.bind(mash_shift, 'j', function()
  hs.layout.apply({
    {"Firefox", nil, screen, positions.right50, nil, nil},
    {"iTerm2",   nil, screen, positions.left50, nil, nil}
  })
end)

hs.hotkey.bind(mash_shift, 'k', function()
  hs.layout.apply({
    {"Firefox", nil, screen, positions.center, nil, nil},
    {"iTerm2",   nil, screen, positions.center, nil, nil}
  })
end)

-- Reload config
-- hs.hotkey.bind(mash, "R", function()
--   hs.reload()
-- end)

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
hs.notify.new({title="hammerspoon", informativeText="Config reloaded"}):send()
