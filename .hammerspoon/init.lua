local token = require('token')
local wm = require("window-management")

local hyper = hyper or {"shift", "cmd", "alt", "ctrl"}
local super = super or {"cmd", "alt", "ctrl"}
local superAlt = superAlt or {"ctrl", "alt", "shift"}

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()

-- Hyper-V paste block:
hs.hotkey.bind(hyper, "V", function()
    hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- Cmd-E - window hints
hs.hotkey.bind(hyper, "E", function()
    hs.hints.windowHints()
end)

hs.network.reachability.internet():setCallback(function(self, flags)
    if (flags & hs.network.reachability.flags.reachable) > 0 then
        hs.alert("Internet Connected")
    else
        hs.alert("Internet Disconnected")
    end
end):start()

function pingResult(object, message, seqnum, error)
    if message == "didFinish" then
        avg = tonumber(string.match(object:summary(), '/(%d+.%d+)/'))
        if avg == 0.0 then
            hs.alert.show("No network")
        elseif avg < 200.0 then
            hs.alert.show("Network good (" .. avg .. "ms)")
        elseif avg < 500.0 then
            hs.alert.show("Network poor(" .. avg .. "ms)")
        else
            hs.alert.show("Network bad(" .. avg .. "ms)")
        end
    end
end

-- Window Management
hs.window.animationDuration = 0
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

-- change screens
hs.hotkey.bind(hyper, "Right", function() hs.window.focusedWindow():moveOneScreenEast() end)
hs.hotkey.bind(hyper, "Left", function() hs.window.focusedWindow():moveOneScreenWest() end)

-- special
hs.hotkey.bind(super, "M", function() wm.windowMaximize(0) end)
hs.hotkey.bind(hyper, "G", function() hs.grid.show() end)

hs.hotkey.bind(hyper, "L", function() hs.caffeinate.startScreensaver() end)
hs.hotkey.bind(hyper, "P", function() hs.network.ping.ping("8.8.8.8", 1, 0.01, 1.0, "any", pingResult) end)

-- App Watchers

function applicationWatcher(appName, eventType, appObject)
    if (eventType == hs.application.watcher.activated) then
        if (appName == "Calendar") then
            -- Bring all Finder windows forward when one gets activated
            appObject:selectMenuItem({"Window", "Bring All to Front"})
        end
    end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
