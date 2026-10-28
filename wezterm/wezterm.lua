local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ----- Theme: Rose Pine Moon (matches nvim/tmux) -----
config.color_scheme = "rose-pine-moon"

-- ----- Font -----
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14.0

-- ----- Window -----
config.window_padding = {
  left = 4,
  right = 4,
  top = 4,
  bottom = 4,
}
config.hide_tab_bar_if_only_one_tab = false
config.window_decorations = "RESIZE"

-- ----- Cursor -----
config.default_cursor_style = "SteadyBlock"

-- ----- Scrollback -----
config.scrollback_lines = 10000

-- ----- Keyboard -----
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = false

-- ----- Graphics protocol (required for inline image rendering, e.g. image.nvim/snacks.nvim) -----
config.enable_kitty_graphics = true

return config
