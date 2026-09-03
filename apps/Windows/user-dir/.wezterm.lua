local wezterm = require 'wezterm'

local config = wezterm.config_builder()


config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font('Monocraft', { weight = 'Regular' })
config.font_size = 12

config.front_end = 'WebGpu'

config.default_cursor_style = 'BlinkingUnderline'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

config.window_background_opacity = 0.95
config.enable_tab_bar = false
config.initial_cols = 110
config.initial_rows = 30

config.window_decorations = 'RESIZE'

config.window_padding = {
  left = 30,
  right = 20,
  top = 0,
  bottom = 10,
}


config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 1000 }

config.keys = {
  { -- Maximize Window
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)
      window:maximize()
    end),
  },

  { -- Restore Window
    key = 'x',
    mods = 'LEADER',
    action = wezterm.action_callback(function(window, pane)
      window:restore()
    end),
  },
  
  { -- Close Current Pane
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },


  { -- Horizontal Split
    key = 'LeftArrow',
    mods = 'LEADER',
    action = wezterm.action.SplitPane { direction = 'Left' },
  },

  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = wezterm.action.SplitPane { direction = 'Right' },
  },

  { -- Vertical Split
    key = 'UpArrow',
    mods = 'LEADER',
    action = wezterm.action.SplitPane { direction = 'Up' },
  },

  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = wezterm.action.SplitPane { direction = 'Down' },
  },


  { -- Horizontal Panel Navigation
    key = 'LeftArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },

  {
    key = 'RightArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },

  { -- Vertical Panel Navigation
    key = 'UpArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },

  {
    key = 'DownArrow',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  }
}

config.mouse_bindings = {
  { -- Move Window
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'ALT',
    action = wezterm.action.StartWindowDrag,
  }
}


-- config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '--login', '-i' }
config.default_prog = { 'pwsh.exe', '--NoLogo' }


wezterm.on('gui-startup', function(cmd)
  local screen = wezterm.gui.screens().active
  local tab, pane, window = wezterm.mux.spawn_window(cmd or {})

  local window_width = 1300
  local window_height = 850

  local x = (screen.width - window_width) / 2
  local y = (screen.height - window_height) / 2

  window:gui_window():set_position(x, y)
end)


return config
