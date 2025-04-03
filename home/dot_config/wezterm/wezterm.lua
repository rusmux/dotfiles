local wezterm = require 'wezterm'
local config = wezterm.config_builder()

wezterm.on("gui-startup", function(_)
    local screen = wezterm.gui.screens().active
    local ratio = 0.5
    local width, height = screen.width * ratio, screen.height * ratio
    wezterm.mux.spawn_window {
        position = {
            x = (screen.width - width + 150) / 2,
            y = (screen.height - height - 150) / 2,
            origin = 'ActiveScreen' }
    }
end)

config.window_padding = { left = '0.5 cell' }
config.window_decorations = 'INTEGRATED_BUTTONS|RESIZE'
-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10
config.window_close_confirmation = 'NeverPrompt'

config.font = wezterm.font {
    family = 'JetBrainsMono Nerd Font Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }, -- disable ligatures
}
config.font_size = 13

config.color_scheme = 'OneDark (base16)'

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'
config.cursor_blink_rate = 500

config.enable_scroll_bar = true
config.colors = { scrollbar_thumb = '#A0A0A0' }

config.hyperlink_rules = wezterm.default_hyperlink_rules()

-- Make IP addresses with port clickable (e.g., 127.0.0.1:5053)
table.insert(config.hyperlink_rules, {
    regex = [[\b(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}):(\d+)\b]],
    format = 'http://$1:$2',
})

-- Match local file paths ending in .html
table.insert(config.hyperlink_rules, {
    regex = [[\b(?:[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*)+\.html\b]],
    format = 'file://$0',
})

config.keys = {
    -- Move cursor one word left with Opt+Left Arrow
    {
        key = "LeftArrow",
        mods = "OPT",
        action = wezterm.action.SendString("\x1bb"),
    },
    -- Move cursor one word right with Opt+Right Arrow
    {
        key = "RightArrow",
        mods = "OPT",
        action = wezterm.action.SendString("\x1bf"),
    },
}

return config
