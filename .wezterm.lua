-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "AdventureTime"
config.color_scheme = "Dark+"

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.8
config.window_background_image = "/home/abhi/Pictures/scary-skull-monster-fantasy-hd-wallpaper-uhdpaper.com-680@0@j.jpg"
config.window_background_image_hsb = {
	brightness = 0.06,
}
config.window_padding = {
	left = 20,
	right = 0,
	top = 0,
	bottom = 0,
}

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

config.hide_mouse_cursor_when_typing = false

-- and finally, return the configuration to wezterm
return config
