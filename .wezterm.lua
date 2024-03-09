-- Pull in the wezterm API
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action
local launch_menu = {}
local mouse_bindings = {}

-- This will hold the configuration.
-- local config = wezterm.config_builder()

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

mouse_bindings = {
  -- Change the default click behavior so that it only selects
  -- text and doesn't open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = act.CompleteSelection 'ClipboardAndPrimarySelection',
  },

  -- and make CTRL-Click open hyperlinks
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
}

table.insert(launch_menu, {
  label = 'PowerShell',
  args = { 'powershell.exe', '-NoLogo' },
})
table.insert(launch_menu, {
  label = 'Pwsh',
  args = { 'pwsh.exe', '-NoLogo' },
})
-- table.insert(launch_menu, {
--   label = 'WSL Debian',
--   args = { 'wsl.exe', '-d', 'Debian' },
--   cwd = "\\\\wsl.localhost\\Debian\\home\\rasmus"
-- })

return {
  default_domain = 'WSL:Debian',
  -- default_prog = { 'pwsh.exe', '-NoLogo' },
  exit_behavior = 'Hold',
  hide_tab_bar_if_only_one_tab = true,
  font = wezterm.font 'MesloLGS NF',
  scrollback_lines = 7000,
  font_size = 16.0,
  initial_cols = 120,
  initial_rows = 36,
  max_fps = 144,
  prefer_to_spawn_tabs = true,
  launch_menu = launch_menu,
  -- show_update_window = true,
  color_scheme = 'tokyonight_night',
  front_end = 'WebGpu',
  animation_fps = 144,
  -- audible_bell = false,
  bypass_mouse_reporting_modifiers = 'ALT',
  custom_block_glyphs = false,
  enable_scroll_bar = true,
  mouse_bindings = mouse_bindings,
  default_cursor_style = 'BlinkingBar',
  -- Tab bar appereance
  window_frame = {
    font = wezterm.font { family = 'Noto Sans', weight = 'Bold' },
    font_size = 12.0,
    inactive_titlebar_bg = '#353535',
    active_titlebar_bg = '#2b2042',
    inactive_titlebar_fg = '#cccccc',
    active_titlebar_fg = '#ffffff',
    inactive_titlebar_border_bottom = '#2b2042',
    active_titlebar_border_bottom = '#2b2042',
    button_fg = '#cccccc',
    button_bg = '#2b2042',
    button_hover_fg = '#ffffff',
    button_hover_bg = '#3b3052',
  },
  -- colors = {
  --   tab_bar = {
  --     -- The color of the inactive tab bar edge/divider
  --     inactive_tab_edge = '#575757',
  --   },
  -- },
  -- inactive_pane_hsb = {
  --   saturation = 0.9,
  --   brightness = 0.8,
  -- },
  -- tab_bar_style = {
  --   active_tab_left = wezterm.format {
  --     { Background = { Color = '#0b0022' } },
  --     { Foreground = { Color = '#2b2042' } },
  --     { Text = SOLID_LEFT_ARROW },
  --   },
  --   active_tab_right = wezterm.format {
  --     { Background = { Color = '#0b0022' } },
  --     { Foreground = { Color = '#2b2042' } },
  --     { Text = SOLID_RIGHT_ARROW },
  --   },
  --   inactive_tab_left = wezterm.format {
  --     { Background = { Color = '#0b0022' } },
  --     { Foreground = { Color = '#1b1032' } },
  --     { Text = SOLID_LEFT_ARROW },
  --   },
  --   inactive_tab_right = wezterm.format {
  --     { Background = { Color = '#0b0022' } },
  --     { Foreground = { Color = '#1b1032' } },
  --     { Text = SOLID_RIGHT_ARROW },
  --   },
  -- }
}

-- if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
--   table.insert(launch_menu, {
--     label = 'PowerShell',
--     args = { 'powershell.exe', '-NoLogo' },
--   })
-- end

-- and finally, return the configuration to wezterm
-- return config
-- return {
--   config = config,
--   launch_menu = launch_menu,
-- }
