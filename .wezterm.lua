local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha (Gogh)"
config.font_size = 14.5
config.window_decorations = "RESIZE"
-- config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false
config.window_frame = {
	font = wezterm.font({ family = "Noto Sans", weight = "Regular" }),
}
config.colors = {
	cursor_bg = "#5B6078",
	cursor_border = "#5B6078",
	cursor_fg = "black",
}
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
return config
