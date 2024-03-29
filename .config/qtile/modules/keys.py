from .groups import group_names
from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from .variables import (
    alt,
    browser,
    file_manager,
    home,
    launcher,
    mod,
    shell,
    terminal,
    system_monitor,
)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def toggle_focus_floating():
    """Toggle focus between floating window and other windows in group"""

    @lazy.function
    def _toggle_focus_floating(qtile):
        group = qtile.current_group
        switch = "non-float" if qtile.current_window.floating else "float"

        for win in reversed(group.focus_history):
            if switch == "float" and win.floating:
                # win.focus(warp=False)
                group.focus(win)
                return
            if switch == "non-float" and not win.floating:
                # win.focus(warp=False)
                group.focus(win)
                return

    return _toggle_focus_floating


keys = [
    # Layout keybinds #
    # Switch between windows
    Key(
        [mod],
        "h",
        lazy.layout.left(),
        desc="Move focus to left",
    ),
    Key(
        [mod],
        "l",
        lazy.layout.right(),
        desc="Move focus to right",
    ),
    Key(
        [mod],
        "j",
        lazy.layout.down(),
        desc="Move focus down",
    ),
    Key(
        [mod],
        "k",
        lazy.layout.up(),
        desc="Move focus up",
    ),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window to the left",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up",
    ),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow(),
        desc="increase size",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.shrink(),
        desc="decrease size",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.screen.next_group(),
        desc="switch to group on right",
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.screen.prev_group(),
        desc="switch to group on left",
    ),
    Key(
        [mod],
        "bracketleft",
        lazy.function(window_to_next_screen),
        desc="send window to next screen",
    ),
    Key(
        [mod],
        "bracketleft",
        lazy.function(window_to_previous_screen),
        desc="send window to previous screen",
    ),
    Key(
        [mod],
        "n",
        lazy.layout.normalize(),
        desc="Reset all window sizes",
    ),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen(),
        desc="Fullscreen",
    ),
    Key(
        [mod],
        "m",
        lazy.layout.maximize(),
        desc="maximize",
    ),
    Key(
        [mod],
        "t",
        toggle_focus_floating(),
    ),
    # Switch focus of monitors #
    Key(
        [mod],
        "period",
        lazy.next_screen(),
        desc="Move focus to next monitor",
    ),
    Key(
        [mod],
        "comma",
        lazy.prev_screen(),
        desc="Move focus to prev monitor",
    ),
    # Toggle between split and unsplit sides of stack.
    # Spit = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    # Key(
    #     [mod, "shift"],
    #     "Return",
    #     lazy.layout.toggle_split(),
    #     desc="Toggle between split and unsplit sides of stack",
    # ),
    # Layout keybinds end #
    # Launch stuff #
    Key(
        [mod],
        "Return",
        lazy.spawn(f"{terminal} -e {shell}"),
        desc="Launch terminal",
    ),
    Key(
        [mod],
        "o",
        lazy.spawn(browser),
        desc="Launch browser",
    ),
    Key(
        [],
        "Print",
        lazy.spawn("flameshot gui"),
        desc="Launch flameshot",
    ),
    Key(
        ["control"],
        "Print",
        lazy.spawn("flameshot screen -c"),
        desc="Launch flameshot",
    ),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("gcolor3"),
        desc="Launch gcolor3 picker",
    ),
    Key(
        [mod, alt],
        "d",
        lazy.spawn("discord"),
        desc="Launch Discord",
    ),
    Key(
        [mod],
        "space",
        lazy.spawn(launcher),
        desc="Launch launcher",
    ),
    Key(
        [mod],
        "p",
        lazy.spawn(f"{home}/scripts/rofi_tmux.py"),
        desc="Launch tmux launcher",
    ),
    Key(
        [mod],
        "s",
        lazy.spawn("scrcpy"),
        desc="Spawn scrcpy",
    ),
    Key(
        [mod],
        "e",
        lazy.spawn(file_manager),
        desc="open file_manager",
    ),
    Key(
        [mod, alt],
        "e",
        lazy.spawn("rofimoji --action type copy"),
        desc="select emoji",
    ),
    Key(
        [mod, alt],
        "g",
        lazy.spawn("rofimoji --file ~/scripts/gitmoji.csv --action type copy"),
        desc="select gitmoji",
    ),
    Key(
        [mod, alt],
        "o",
        lazy.spawn("/home/tusqasi/scripts/ocr"),
        desc="run ocr on screen",
    ),
    Key(
        [],
        "XF86Calculator",
        lazy.spawn("qalculate-gtk"),
        desc="calculator",
    ),
    Key(
        ["control", "shift"],
        "Escape",
        lazy.spawn(system_monitor),
        desc="task manager",
    ),
    Key(
        [mod, alt],
        "y",
        lazy.spawn("/home/tusqasi/scripts/play_clipboard_youtube.sh"),
        desc="run mpv with current clipboadr youtube link",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("/home/tusqasi/scripts/rofi_clipboard.py"),
        desc="Clipboard rofi program",
    ),
    # Launch stuff end #
    # power stuff
    Key(
        [mod, alt],
        "p",
        lazy.spawn("python -m rofi_rbw.rofi_rbw"),
        desc="Bitwarden rofi",
    ),
    # Layout
    Key(
        [mod],
        "Tab",
        lazy.next_layout(),
        desc="Toggle between layouts",
    ),
    Key(
        [mod],
        "w",
        lazy.window.kill(),
        desc="Kill focused window",
    ),
    # Make floating
    Key(
        [mod, "control"],
        "f",
        lazy.window.toggle_floating(),
    ),
    Key(
        [mod, "control"],
        "r",
        lazy.restart(),
        desc="Restart Qtile",
    ),
    Key(
        [mod],
        "r",
        lazy.spawncmd(),
        desc="Spawn a command using a prompt widget",
    ),
    # Volume and media
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("pactl -- set-sink-volume  @DEFAULT_SINK@ +5%"),
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl -- set-sink-volume  @DEFAULT_SINK@  -5%"),
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute  @DEFAULT_SINK@  toggle"),
    ),
    Key(
        [],
        "XF86AudioPlay",
        lazy.spawn("playerctl play-pause"),
    ),
    Key(
        [],
        "XF86AudioPause",
        lazy.spawn("playerctl play-pause"),
    ),
    Key(
        [],
        "XF86AudioNext",
        lazy.spawn("playerctl next"),
    ),
    Key(
        [],
        "XF86AudioPrev",
        lazy.spawn("playerctl previous"),
    ),
    # Volume and media end
    # Backlight control
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("xbacklight -inc 10"),
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("xbacklight -dec 15"),
    ),
    Key(
        [mod],
        "XF86AudioRaiseVolume",
        lazy.spawn("xbacklight -inc 10"),
        desc="Increase brightness",
    ),
    Key(
        [mod],
        "XF86AudioLowerVolume",
        lazy.spawn("xbacklight -dec 15"),
        desc="Lower brightness",
    ),
]
inverted = [
    "exclam",
    "at",
    "numbersign",
    "dollar",
    "percent",
    "caret",
]
for i, ((name, kwargs), inv) in enumerate(zip(group_names, inverted), 1):
    keys.append(
        Key(
            [mod],
            str(i),
            lazy.group[name].toscreen(),
            desc="Switch to group",
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            str(i),
            lazy.window.togroup(name),
            desc="Send window to group",
        )
    )
    keys.append(
        Key(
            [mod, alt],
            str(i),
            lazy.window.togroup(name, switch_group=True),
            desc="Switch to group with window",
        )
    )
    keys.append(
        Key(
            [mod],
            str(inv),
            lazy.group[name].toscreen(),
            desc="Switch to group",
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            str(inv),
            lazy.window.togroup(name),
            desc="Send window to group",
        )
    )
    keys.append(
        Key(
            [mod, alt],
            str(inv),
            lazy.window.togroup(name, switch_group=True),
            desc="Switch to group with window",
        )
    )
