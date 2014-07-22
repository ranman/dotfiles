-- Hi!
-- Save this as ~/.hydra/init.lua and choose Reload Config from the menu

hydra.alert("Randall config loaded", 1.5)

-- Autolaunch at login
autolaunch.set(true)

-- save the time when updates are checked
function checkforupdates()
  updates.check()
  settings.set('lastcheckedupdates', os.time())
end

-- show available updates
local function showupdate()
  os.execute('open https://github.com/sdegutis/Hydra/releases')
end

-- what to do when an update is checked
function updates.available(available)
  if available then
    notify.show("Hydra update available", "", "Click here to see the changelog and maybe even install it", "showupdate")
  else
    hydra.alert("No update available.")
  end
end

-- check for updates every week
timer.new(timer.weeks(1), checkforupdates):start()
notify.register("showupdate", showupdate)

-- if this is your first time running Hydra, you're launching it more than a week later, check now
local lastcheckedupdates = settings.get('lastcheckedupdates')
if lastcheckedupdates == nil or lastcheckedupdates <= os.time() - timer.days(7) then
  checkforupdates()
end

-- show a helpful menu
menu.show(function()
    local updatetitles = {[true] = "Install Update", [false] = "Check for Update..."}
    local updatefns = {[true] = updates.install, [false] = checkforupdates}
    local hasupdate = (updates.newversion ~= nil)

    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "Open REPL", fn = repl.open},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = updatetitles[hasupdate], fn = updatefns[hasupdate]},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

-- move the window to the right half of the screen
function movewindow_righthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  newframe.x = newframe.w
  win:setframe(newframe)
end
hotkey.new({"cmd", "ctrl", "alt"}, "RIGHT", movewindow_righthalf):enable()

-- move the window to the left half of the screen
function movewindow_lefthalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.w = newframe.w / 2
  win:setframe(newframe)
end
hotkey.new({"cmd", "ctrl", "alt"}, "LEFT", movewindow_lefthalf):enable()

-- move the window to the top half of the screen
function movewindow_tophalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  win:setframe(newframe)
end
hotkey.new({"cmd", "ctrl", "alt"}, "UP", movewindow_tophalf):enable()

-- move the window to the top half of the screen
function movewindow_bottomhalf()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.y = newframe.h
  win:setframe(newframe)
end
hotkey.new({"cmd", "ctrl", "alt"}, "DOWN", movewindow_bottomhalf):enable()

-- move the window to the top half of the screen
function movewindow_bottomleft()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.y = newframe.h
  win:setframe(newframe)
end
hotkey.new({"ctrl", "shift", "alt"}, "LEFT", movewindow_bottomleft):enable()

-- move the window to the top half of the screen
function movewindow_bottomright()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.y = newframe.h
  newframe.x = newframe.x / 2
  win:setframe(newframe)
end
hotkey.new({"ctrl", "shift", "alt"}, "DOWN", movewindow_bottomright):enable()

-- move the window to the top half of the screen
function movewindow_topright()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.y = newframe.h
  win:setframe(newframe)
end
hotkey.new({"ctrl", "shift", "alt"}, "UP", movewindow_bottomleft):enable()

-- move the window to the top half of the screen
function movewindow_topleft()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  newframe.h = newframe.h / 2
  newframe.w = newframe.w / 2
  newframe.y = newframe.h
  win:setframe(newframe)
end
hotkey.new({"ctrl", "shift", "alt"}, "RIGHT", movewindow_bottomleft):enable()

-- move the window to the top half of the screen
function movewindow_maximize()
  local win = window.focusedwindow()
  local newframe = win:screen():frame_without_dock_or_menu()
  win:setframe(newframe)
end
hotkey.new({"cmd", "ctrl", "alt"}, "M", movewindow_maximize):enable()
