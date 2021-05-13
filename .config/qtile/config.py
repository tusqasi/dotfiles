import subprocess
from typing import List  # noqa: F401

from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from keys import keys
from color import colors
from layout import layouts
from variables import home

widget_defaults = dict(
    font="Cascadia Code",
    fontsize=13,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayoutIcon(),
                widget.GroupBox(
                    background=colors["bg"],
                    highlight_method='line',
                    highlight_color= colors["highlight"],
                    this_current_screen_border=colors["line"],
                    hide_unused=True,
                    disable_drag=True,
                ),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                # widget.Wlan(), # TODO: Make this work
                widget.Systray(
                    padding=10,
                ),
                widget.Sep(
                    linewidth=7,
                    foreground="#000000"),
                widget.BatteryIcon(),
                widget.Battery(format='{percent:.0%}'),
                # widget.QuickExit(
                #     default_text="Shutdown",
                #     background=colors["red"],
                #     # padding=5,
                # ),
            ],
            24,
        ),
    ),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
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
    subprocess.Popen(f"{home}scripts/startup.fish")


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
