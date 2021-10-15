import subprocess
from typing import List  # noqa: F401

from libqtile import bar, hook, layout, widget
from libqtile import qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from keys import keys
from color import colors
from layout import layouts
from variables import startup_script, home
from group import groups

widget_defaults = dict(
    font="CozetteVector",
    foreground=colors["fg"],
    fontsize=20,
    padding=0,
    background=colors["bg"],
)
extension_defaults = widget_defaults.copy()
common_left = [
    widget.GroupBox(
        background=colors["bg_light"],
        block_highlight_text_color=colors["visible_groups_text"],
        active=colors["group_not_visible"],
        other_screen_border=colors["other_scr_unfocused_bg"],
        other_current_screen_border=colors["other_scr_focused_bg"],
        highlight_color=colors["current_scr_bg"],
        this_current_screen_border=colors["line"],
        this_screen_border="a3571b",
        highlight_method="block",
        hide_unused=True,
        disable_drag=True,
    ),
    widget.TextBox(
        text="",
        foreground=colors["bg_light"],
        # background=colors["bg_dark"],
        # padding=0,
    ),
]
common_right = [
    widget.TextBox(
        text="",
        foreground="#2f8ccd",
        background=colors["bg_dark"],
        padding=3,
    ),
    widget.Clock(
        format="%Y-%m-%d %a %I:%M %p ",
        background=colors["bg_dark"],
        foreground=colors["fg_on_dark"],
    ),
]
main_screen = Screen(
    top=bar.Bar(
        [
            widget.Image(
                filename="~/.config/qtile/images/py.ico",
                scale="False",
            ),
            widget.CurrentLayoutIcon(),
            *common_left,
            widget.Prompt(
                padding=5,
            ),
            widget.WindowName(
                padding=5,
                # background=colors["bg_dark"],
                # max_chars=10,
                # padding=0,
            ),
            widget.Chord(),
            # widget.TextBox(
            #     text="",
            #     foreground=colors["bg_dark"],
            #     # padding=0,
            # ),
            widget.Spacer(),
            widget.TextBox(
                text="",
                foreground=colors["bg_dark"],
            ),
            widget.TextBox(
                text="",
                foreground="#689d6a",
                background=colors["bg_dark"],
            ),
            widget.CPUGraph(
                graph_color="689d6a",
                fill_color="689d6a",
                background=colors["bg_dark"],
            ),
            widget.TextBox(
                text="﬙",
                foreground="#d65d0e",
                background=colors["bg_dark"],
            ),
            widget.MemoryGraph(
                graph_color="d65d0e",
                fill_color="d65d0e",
                background=colors["bg_dark"],
            ),
            *common_right,
            # widget.Wlan(), # TODO: Make this work
            widget.TextBox(
                text="",
                foreground=colors["bg_light"],
                background=colors["bg_dark"],
                padding=1,
            ),
            widget.Systray(
                padding=4,
                background=colors["bg_light"],
            ),
            widget.Sep(
                linewidth=5,
                foreground=colors["bg_light"],
                background=colors["bg_light"],
            ),
            widget.BatteryIcon(
                background=colors["bg_light"],
            ),
            widget.Battery(
                format="{percent:.0%}",
                background=colors["bg_light"],
                foreground="000000",
            ),
            # widget.QuickExit(
            #     default_text="Shutdown",
            #     background=colors["red"],
            #     # padding=5,
            # ),
        ],
        22,
    ),
    x=0,
    y=0,
    width=1920,
    height=1080,
)
second_screen = Screen(
    top=bar.Bar(
        [
            widget.Image(
                filename="~/.config/qtile/images/py.ico",
                scale="False",
            ),
            widget.CurrentLayoutIcon(),
            *common_left,
            widget.WindowName(),
            widget.TextBox(
                text="",
                foreground=colors["bg_dark"],
                background=colors["bg"],
                padding=1,
            ),
            widget.TextBox(
                text="",
                foreground="#2f8ccd",
                background=colors["bg_dark"],
            ),
            widget.Clock(
                format="%Y-%m-%d %a %I:%M %p ",
                background=colors["bg_dark"],
                foreground=colors["fg_on_dark"],
            ),
        ],
        22,
    ),
    x=1920,
    y=0,
    width=1366,
    height=768,
)

tv = Screen(
    top=bar.Bar(
        [
            widget.Image(
                filename="~/.config/qtile/images/py.ico",
                scale="False",
            ),
            widget.CurrentLayoutIcon(),
            *common_left,
            widget.WindowName(),
            widget.TextBox(
                text="",
                foreground=colors["bg_dark"],
                background=colors["bg"],
                padding=1,
            ),
            widget.TextBox(
                text="",
                foreground="#2f8ccd",
                background=colors["bg_dark"],
            ),
            widget.Clock(
                format="%Y-%m-%d %a %I:%M %p ",
                background=colors["bg_dark"],
                foreground=colors["fg_on_dark"],
            ),
        ],
        22,
    ),
    x=0,
    y=1080,
    width=1920,
    height=1080,
)
screens = [main_screen]

# fake_screens = [main_screen, second_screen]
# fake_screens = [main_screen, tv]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = "floating_only"
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="zoom"),  # zoom
        Match(wm_class="gcolor3"),  # gcolor3
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True


@hook.subscribe.startup_once
def start_up():
    subprocess.Popen(f"{startup_script}")
    lazy.group["WWW"].toscreen()


@hook.subscribe.client_new
def send_to_www(window):
    windowtype = window.window.get_wm_class()[1]
    browsers = ["firefox", "brave","chromium", "qutebrowser"]
    if windowtype.lower() in browsers:
        window.togroup("WWW")


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
