local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.font_size = 14.5
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
return config