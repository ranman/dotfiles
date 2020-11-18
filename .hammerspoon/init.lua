local token = require('token')
local wm = require("window-management")

local hyper = hyper or {"shift", "cmd", "alt", "ctrl"}
local super = super or {"cmd", "alt", "ctrl"}
local superAlt = superAlt or {"ctrl", "alt", "shift"}
-- Hyper-V paste block:
hs.hotkey.bind(hyper, "V", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Hyper-G - type Github token
hs.hotkey.bind(hyper, "G", function()
    token_keystroke("amazon-token")
end)

-- Cmd-E - window hints
hs.hotkey.bind(hyper, "e", function()
    hs.hints.windowHints()
end)

function reload_config(files)
    hs.reload()
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

hs.network.reachability.internet():setCallback(function(self, flags)
    if (flags & hs.network.reachability.flags.reachable) > 0 then
        hs.alert("Internet Connected")
    else
        hs.alert("Internet Disconnected")
    end
end):start()

-- Window Management

-- halfs
hs.hotkey.bind(super, "Right", function() wm.moveWindowToPosition(wm.screenPositions.right) end)
hs.hotkey.bind(super, "Left", function() wm.moveWindowToPosition(wm.screenPositions.left) end)
hs.hotkey.bind(super, "Up", function() wm.moveWindowToPosition(wm.screenPositions.top) end)
hs.hotkey.bind(super, "Down", function() wm.moveWindowToPosition(wm.screenPositions.bottom) end)
-- quarters
hs.hotkey.bind(superAlt, "Right", function() wm.moveWindowToPosition(wm.screenPositions.bottomRight) end)
hs.hotkey.bind(superAlt, "Left", function() wm.moveWindowToPosition(wm.screenPositions.topLeft) end)
hs.hotkey.bind(superAlt, "Up", function() wm.moveWindowToPosition(wm.screenPositions.topRight) end)
hs.hotkey.bind(superAlt, "Down", function() wm.moveWindowToPosition(wm.screenPositions.bottomLeft) end)

-- special
hs.hotkey.bind(super, "m", function() wm.windowMaximize(0) end)

-- change screens
hyper.bindKey("Right", function() hs.window.focusedWindow():moveOneScreenEast() end)
hyper.bindKey("Left", function() hs.window.focusedWindow():moveOneScreenWest() end)