from libqtile import bar

from libqtile import widget

bar_1 = bar.Bar(
    [
        widget.Image(
            filename="~/.config/qtile/py_logo.png",
            margin=4,
            background="#2f343f",
        ),
        widget.CurrentLayoutIcon(
            scale=0.75,
            background="#2f343f",
        ),
        widget.GroupBox(
            highlight_method="line",
            this_screen_border="#5294e2",
            this_current_screen_border="#5294e2",
            active="#ffffff",
            inactive="#848e96",
            background="#2f343f",
            disable_drag=True,
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=28,
            foreground="#2f343f",
        ),
        widget.TextBox(
            text="",
            padding=0,
            fontsize=28,
            foreground="#2f343f",
        ),
        widget.Prompt(),
        widget.Spacer(
            length=5,
        ),
        widget.WindowName(
            foreground="#99c0de",
            max_chars=20,
        ),
        widget.TaskList(
            border="#2eb039",
            icon_size=14,
            padding=0,
            margin=0,
            parse_text=lambda x: "",
        ),
        widget.Chord(
            chords_colors={
                "launch": ("#ff0000", "#ffffff"),
            },
            name_transform=lambda name: name.upper(),
        ),
        widget.TextBox(
            text="﬙",
            foreground="#d65d0e",
        ),
        widget.MemoryGraph(fill_color="#e29545"),
        widget.TextBox(
            text="",
            foreground="#689d6a",
        ),
        widget.CPUGraph(),
        widget.Systray(icon_size=20),
        widget.TextBox(
            text="",
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
        widget.BatteryIcon(),
        widget.Battery(
            format="{percent:.0%}",
        ),
    ],
    22,  # height in px
    background="#404552",  # background color
)
