local wezterm = require("wezterm")

return {
	-- Font settings
	font = wezterm.font("FiraCode Nerd Font Mono"),
	font_size = 16.0,

	-- Launch terminal-shell from PATH
	default_prog = { "terminal-shell" },

	-- Cursor settings
	default_cursor_style = "SteadyBlock", -- Not blinking
	cursor_blink_rate = 0,

	-- Cell size tweaks
	cell_width = 1.05,
	line_height = 1.15,

	-- -- Background opacity
	-- window_background_opacity = 0.9,

	-- Optional: explicitly use fish as shell (only needed if `terminal-shell` relies on it)
	set_environment_variables = {
		SHELL = "fish",
	},

	-- Clean UI
	enable_tab_bar = false,
	background = {
		{
			source = {
				File = wezterm.home_dir .. "/devenv/wallpaper/wallpapers/hyprland_wallpaper_contest_winners_Kath.png",
			},
		},
		{
			source = {
				Color = "rgba(28, 33, 39, 0.95)",
			},
			height = "100%",
			width = "100%",
		},
	},
}
