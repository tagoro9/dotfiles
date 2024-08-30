local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = "Dracula (Official)"
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.font = wezterm.font  "MesloLGS NF"
config.audible_bell = "Disabled"

return config
