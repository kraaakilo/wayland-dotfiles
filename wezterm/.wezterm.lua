-- Pull in the wezterm API
local wezterm = require("wezterm")
-- This will hold the configuration.
local config = wezterm.config_builder()

config.enable_wayland = false

-- or, changing the font size and color scheme.
config.font_size = 14
config.color_scheme = "Tokyo Night"
config.window_decorations = "RESIZE"
config.default_prog = { "zsh" }
config.keys = {
  {
    key = "e",
    mods = "LEADER",
    action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "o",
    mods = "LEADER",
    action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "c",
    mods = "LEADER",
    action = wezterm.action.SpawnTab("CurrentPaneDomain"),
  },
  {
    key = "z",
    mods = "LEADER",
    action = wezterm.action.TogglePaneZoomState,
  },
  -- Navigate tabs
  {
    key = "LeftArrow",
    mods = "SHIFT",
    action = wezterm.action.ActivateTabRelative(-1),
  },
  {
    key = "RightArrow",
    mods = "SHIFT",
    action = wezterm.action.ActivateTabRelative(1),
  },
  -- Switch panes with Alt+Arrow keys
  {
    key = "LeftArrow",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Left"),
  },
  {
    key = "RightArrow",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Right"),
  },
  {
    key = "UpArrow",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Up"),
  },
  {
    key = "DownArrow",
    mods = "ALT",
    action = wezterm.action.ActivatePaneDirection("Down"),
  },
}
-- Set Ctrl+s as the leader key
config.leader = { key = "s", mods = "CTRL" }
-- Set font with better rendering options
config.font = wezterm.font_with_fallback({
  "JetBrainsMono NF",
  "Consolas",
  "Monaco",
})
-- Font rendering improvements
config.freetype_load_target = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"
config.tab_bar_at_bottom = true
config.colors = {
  tab_bar = {
    background = "#f6f5f4",
    active_tab = {
      bg_color = "#ffffff",
      fg_color = "#2e3436",
    },
    inactive_tab = {
      bg_color = "#deddda",
      fg_color = "#5e5c64",
    },
  },
}
-- Finally, return the configuration to wezterm:
return config
