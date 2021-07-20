from libqtile.config import Group
from libqtile.config import Key
from libqtile.command import lazy
from variables import *
from group import groups, group_names

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
        "j",
        lazy.layout.grow(),
        desc="increase size",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.shrink(),
        desc="decrease size",
    ),
    # Key([mod, "control"], "h",lazy.layout.decrease_ratio(),,),
    # Key([mod, "control"], "l",lazy.layout.increase_ratio(),,),
    # Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down",),
    # Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up",),
    Key(
        [mod,"control"],
        "l",
        lazy.screen.next_group(),
        desc="switch to group on right",
    ),
    Key(
        [mod,"control"],
        "h",
        lazy.screen.prev_group(),
        desc="switch to group on left",
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
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
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
        [mod, "shift"],
        "space",
        lazy.spawn("rofi -show run"),
        desc="Launch launcher",
    ),
    Key(
        [mod],
        "p",
        lazy.spawn(f"{home}/scripts/rofi_tmux.sh"),
        desc="Launch tmux launcher",
    ),
    Key(
        [mod],
        "e",
        lazy.spawn(file_manager),
    ),
    Key(
        [mod, alt],
        "e",
        lazy.spawn("rofimoji"),
        desc="select emoji",
    ),
    Key(
        [mod, alt],
        "o",
        lazy.spawn("/home/tusqasi/scripts/ocr"),
        desc="select emoji",
    ),
    # Launch stuff end #
    # Toggle between different layouts as defined below
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
        [mod, "shift"],
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
        lazy.spawn("pactl -- set-sink-volume 0 +5%"),
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("pactl -- set-sink-volume 0 -5%"),
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("pactl set-sink-mute 0 toggle"),
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
]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(
        Key(
            [mod],
            str(i),
            lazy.group[name].toscreen(),
        )
    )
    keys.append(
        Key(
            [mod, "shift"],
            str(i),
            lazy.window.togroup(name),
        )
    )
    keys.append(
        Key(
            [mod, alt],
            str(i),
            lazy.window.togroup(name, switch_group=True),
        )
    )
