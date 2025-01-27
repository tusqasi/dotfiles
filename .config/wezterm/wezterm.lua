local w               = require 'wezterm'
local config          = w.config_builder()
local act             = w.action
local act_callback    = w.action_callback
local mux             = w.mux

local project_folders = { "~/sandbox/", "~/projects/" }

local is_linux        = function()
	return w.target_triple:find("linux") ~= nil
end
local is_windows      = function()
	return w.target_triple:find("windows") ~= nil
end

local function string_split(pString, pPattern)
	local Table = {} -- NOTE: use {n = 0} in Lua-5.0
	local fpat = "(.-)" .. pPattern
	local last_end = 1
	local s, e, cap = pString:find(fpat, 1)
	while s do
		if s ~= 1 or cap ~= "" then
			table.insert(Table, cap)
		end
		last_end = e + 1
		s, e, cap = pString:find(fpat, last_end)
	end
	if last_end <= #pString then
		cap = pString:sub(last_end)
		table.insert(Table, cap)
	end
	return Table
end


if is_linux() then
	config.default_prog = { '/usr/bin/zsh', '-l' }
end
config.window_decorations           = "NONE"
config.font_size                    = 10.0
config.leader                       = { key = "a", mods = "CTRL" }
config.use_fancy_tab_bar            = false
config.disable_default_key_bindings = true;
config.inactive_pane_hsb            = {
	saturation = 0.9,
	brightness = 0.9,
}
w.on('gui-startup', function(cmd)
	local _tab, _pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)
w.on('update-right-status', function(window, pane)
	local status = window:active_workspace()
	if window:leader_is_active() then
		status = w.format {
			{ Foreground = { Color = "#ff0000" }, },
			{ Text = "L | " .. window:active_workspace() },
		}
	end
	window:set_right_status(status)
end)


local function sessionizer()
	return act_callback(function(window, pane)
		local projects    = {}
		local _folder_cmd = ""
		if is_linux() then
			_folder_cmd = [[find %s -maxdepth 1 -type d]]
		elseif is_windows() then
			_folder_cmd = [[dir "%s" /b]]
		end
		for index, dir in ipairs(project_folders) do
			for dir in io.popen(string.format(_folder_cmd, dir)):lines() do
				table.insert(projects, { id = dir, label = dir })
			end
		end
		window:perform_action(act.InputSelector {
				action = w.action_callback(function(window_inner, pane_inner, id, label)
					if (not id and not label) then return end
					local split_location = string_split(id, "/")
					local workspace_name = split_location[#split_location]
					window_inner:perform_action(
						act.SwitchToWorkspace({ name = workspace_name, spawn = { cwd = label } }),
						pane_inner
					)
				end),
				choices = projects,
				fuzzy = true,
				fuzzy_description = w.format {
					{ Foreground = { Color = "#0f0" }, },
					{ Text = 'Project> ' } },
			},
			pane)
	end)
end


local function split_nav(resize_or_move, key)
	local function is_vim(pane)
		return pane:get_user_vars().IS_NVIM == 'true'
	end
	local direction_keys = {
		h = 'Left',
		j = 'Down',
		k = 'Up',
		l = 'Right',
	}
	return {
		key = key,
		mods = resize_or_move == 'resize' and 'META' or 'CTRL',
		action = w.action_callback(function(win, pane)
			if is_vim(pane) then
				win:perform_action({
					SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
				}, pane)
			else
				if resize_or_move == 'resize' then
					win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
					win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
		end),
	}
end

local keys  = {
	-- tmux
	{ key = 'a', mods = 'LEADER|CTRL',  action = act.SendKey { key = 'a', mods = 'CTRL' }, },
	{ key = "'", mods = "LEADER",       action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = '"', mods = "LEADER|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "n", mods = "LEADER",       action = act.ActivateTabRelative(1) },
	{ key = "p", mods = "LEADER",       action = act.ActivateTabRelative(-1) },
	{ key = "c", mods = "LEADER",       action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "1", mods = "LEADER",       action = act.ActivateTab(0) },
	{ key = "2", mods = "LEADER",       action = act.ActivateTab(1) },
	{ key = "3", mods = "LEADER",       action = act.ActivateTab(2) },
	{ key = "4", mods = "LEADER",       action = act.ActivateTab(3) },
	{ key = "5", mods = "LEADER",       action = act.ActivateTab(4) },
	{ key = "6", mods = "LEADER",       action = act.ActivateTab(5) },
	{ key = "7", mods = "LEADER",       action = act.ActivateTab(6) },
	{ key = "8", mods = "LEADER",       action = act.ActivateTab(7) },
	{ key = "9", mods = "LEADER",       action = act.ActivateTab(8) },
	{ key = "x", mods = "LEADER",       action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "s", mods = "LEADER",       action = act.ShowLauncherArgs { flags = 'FUZZY|WORKSPACES' }, },
	{ key = "f", mods = "LEADER",       action = sessionizer() },
	{
		key = "P",
		mods = "LEADER",
		action = act.PromptInputLine {
			description = w.format {
				{ Attribute = { Intensity = 'Bold' } },
				{ Foreground = { Color = "#0f0" } },
				{ Text = 'workspace_name' },
			},
			action = w.action_callback(function(window, pane, line)
				if not line then return end
				window:perform_action(act.SwitchToWorkspace { name = line, }, pane)
			end),
		},
	},
	split_nav('move', 'h'),
	split_nav('move', 'j'),
	split_nav('move', 'k'),
	split_nav('move', 'l'),
	split_nav('resize', 'h'),
	split_nav('resize', 'j'),
	split_nav('resize', 'k'),
	split_nav('resize', 'l'),
	-- tmux end
	{ key = "0",   mods = "CTRL",         action = act.ResetFontSize, },
	{ key = "F11", mods = "",             action = act.ToggleFullScreen, },
	{ key = "I",   mods = "LEADER|SHIFT", action = act.ReloadConfiguration, },
	{ key = "=",   mods = "CTRL",         action = act.IncreaseFontSize, },
	{ key = "-",   mods = "CTRL",         action = act.DecreaseFontSize, },
	{ key = "c",   mods = "CTRL|SHIFT",   action = act.CopyTo "Clipboard", },
	{ key = "V",   mods = "CTRL|SHIFT",   action = act.PasteFrom "Clipboard", },
}
config.keys = keys
return config
