local module = { cache = cache }
local hyper   = {"cmd", "ctrl", "shift"}

module.start = function()
    -- App Launching
    hs.hotkey.bind(hyper, 'J', function () hs.application.launchOrFocus("iTerm") end)
    hs.hotkey.bind(hyper, 'K', function () hs.application.launchOrFocus("Firefox") end)
    hs.hotkey.bind(hyper, 'T', function () hs.application.launchOrFocus("Transmit") end)
    hs.hotkey.bind(hyper, 'M', function () hs.application.launchOrFocus("Mail") end)
    hs.hotkey.bind(hyper, 'G', function () hs.application.launchOrFocus("Tower") end)

    -- Reload config
    hs.hotkey.bind(hyper, "R", function()
      hs.reload()
    end)
end

return module
