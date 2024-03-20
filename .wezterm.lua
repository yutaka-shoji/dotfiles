local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Color Scheme
config.color_scheme = "nord"
-- Font
config.font = wezterm.font("Hack Nerd Font Mono")
-- Background Opacity
config.window_background_opacity = 0.90

config.initial_rows = 36
config.initial_cols = 128

return config
