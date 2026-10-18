local mainMod = "SUPER" -- Sets "Windows/Super" key as main modifier

-- Default apps
local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "hyprlauncher"

-- Launch apps
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- Window management
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Move focus with mainMod + hjkl keys
hl.bind(mainMod .. " + h", function()
  hl.dispatch(hl.dsp.focus({ direction = "left" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + l", function()
  hl.dispatch(hl.dsp.focus({ direction = "right" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + k", function()
  hl.dispatch(hl.dsp.focus({ direction = "up" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind(mainMod .. " + j", function()
  hl.dispatch(hl.dsp.focus({ direction = "down" }))
  hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- Swap windows with mainMod + hjkl keys
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.window.swap({ direction = "right" }))

-- Switch workspaces with mainMod + [1-5]
-- Move active window to a workspace with mainMod + SHIFT + [1-5]
for i = 1, 5 do
  local key = i
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind(
    mainMod .. " + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = i })
  )
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(
  mainMod .. " + SHIFT + S",
  hl.dsp.window.move({ workspace = "special:magic" })
)

hl.bind(mainMod .. "+ u", function()
  local window = hl.get_active_window()
  if not window then
    return
  end
  if not window.floating then
    return
  end
  hl.dispatch(hl.dsp.window.cycle_next({
    floating = not window.floating,
    tiled = window.floating,
  }))
end)

hl.bind(mainMod .. "+ d", function()
  local window = hl.get_active_window()
  if not window then
    return
  end
  if window.floating then
    return
  end
  hl.dispatch(hl.dsp.window.cycle_next({
    floating = not window.floating,
    tiled = window.floating,
  }))
end)

hl.bind("ALT + Tab", function()
  hl.dispatch(hl.dsp.window.cycle_next())
  hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top if floating
end)

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize windows with mainMod + '-'/'+' keys
hl.bind(mainMod .. " + equal", hl.dsp.layout("colresize +0.02"))
hl.bind(mainMod .. " + minus", hl.dsp.layout("colresize -0.02"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind(
  "XF86AudioRaiseVolume",
  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true }
)

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind(
  "XF86AudioPause",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { locked = true }
)
hl.bind(
  "XF86AudioPlay",
  hl.dsp.exec_cmd("playerctl play-pause"),
  { locked = true }
)
hl.bind(
  "XF86AudioPrev",
  hl.dsp.exec_cmd("playerctl previous"),
  { locked = true }
)
