from libqtile import bar

# from .widgets import *
from libqtile import widget
from libqtile import qtile
from libqtile.config import Screen
from .variables import terminal
import os

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                    filename="~/.config/qtile/py_logo.png",
                    margin=4,
                ),
                widget.CurrentLayoutIcon(scale=0.75),
                widget.Sep(padding=4, linewidth=0, background="#2f343f",),
                widget.GroupBox(
                    highlight_method="line",
                    this_screen_border="#5294e2",
                    this_current_screen_border="#5294e2",
                    active="#ffffff",
                    inactive="#848e96",
                    background="#2f343f",
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.Prompt(),
                widget.Spacer(length=5,),
                widget.WindowName(foreground="#99c0de", fmt="{}",),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(icon_size=20),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
                widget.Clock(
                      format=" %Y-%m-%d %a %I:%M %p ",
                    background="#2f343f",
                    foreground="#9bd689",
                ),
                widget.TextBox(
                    text="",
                    padding=0,
                    fontsize=28,
                    foreground="#2f343f",
                ),
            ],
            25,  # height in px
            background="#404552",  # background color
        ),
    ),
]
