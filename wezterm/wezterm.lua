-- These are the basic's for using wezterm.
-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- These are vars to put things in later (i dont use em all yet)
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- This is for newer wezterm vertions to use the config builder 
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Make window opaque
config.window_background_opacity = 0.93

-- Default config settings
-- These are the default config settins needed to use Wezterm
-- Just add this and return config and that's all the basics you need

-- Color scheme, Wezterm has 100s of them you can see here:
-- https://wezfurlong.org/wezterm/colorschemes/index.html
-- This is my chosen font, we will get into installing fonts on windows later
config.font = wezterm.font('Hasklug Nerd Font Propo',
    {weight = 'Light'})
config.font_size = 11
config.launch_menu = launch_menu
config.disable_default_key_bindings = true
-- this adds the ability to use ctrl+v to paste the system clipboard 
config.keys = {{ key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },}
config.mouse_bindings = mouse_bindings
config.window_close_confirmation = "NeverPrompt"

-- Appearance
config.hide_mouse_cursor_when_typing = true
config.color_scheme = "Pnevma"

config.font_size = 9
config.window_decorations = "RESIZE" -- this makes the terminal fullscreen

config.window_padding = {
	left = 10,
	right = 10,
	top = 10,
	bottom = 10,
}

-- There are mouse binding to mimc Windows Terminal and let you copy
-- To copy just highlight something and right click. Simple
mouse_bindings = {
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
 {
  event = { Down = { streak = 1, button = "Right" } },
  mods = "NONE",
  action = wezterm.action_callback(function(window, pane)
   local has_selection = window:get_selection_text_for_pane(pane) ~= ""
   if has_selection then
    window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
    window:perform_action(act.ClearSelection, pane)
   else
    window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
   end
  end),
 },
}

-- This is used to make my foreground (text, etc) brighter than my background
config.foreground_text_hsb = {
  hue = 0.8,
  saturation = 1.2,
  brightness = 1.8,
}

config.front_end = 'WebGpu'

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
config.default_domain = 'WSL:Ubuntu'
config.enable_tab_bar = false

-- Remove window decorations
-- config.window_decorations = "NONE"

return config