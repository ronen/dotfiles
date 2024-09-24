local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.enable_wayland = false
config.font_size = 10
config.adjust_window_size_when_changing_font_size = false
config.scrollback_lines = 3000
config.default_workspace = "main"

return config
