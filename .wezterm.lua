wezterm = require 'wezterm'

return {
  term = 'xterm-256color',
  window_background_image = '/Users/sean.cunniffe/Documents/trees-background.jpg',
  window_background_image_hsb = {
    brightness = 0.04,
    hue = 0.8,
    saturation = 0.8,
  },
  -- font = wezterm.font("3270 Nerd Font Propo", { weight = "Bold" }),
  -- font_size = 14.0,
  font = wezterm.font('JetBrains Mono', {}),
  font_size = 13.0,
  tab_bar_at_bottom = false,
  hide_tab_bar_if_only_one_tab = true, -- hides the tab bar if only one tab
}
