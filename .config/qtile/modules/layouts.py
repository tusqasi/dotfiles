from libqtile import layout
from libqtile.config import Match

layout_default = {
    "border_focus": "50d450",
    "border_normal": "000000",
    "border_width": 3,
    "max_ratio": 0.9,
    "min_ratio": 0.1,
}
layouts = [
    layout.MonadTall(**layout_default),
    layout.MonadWide(**layout_default),
    layout.Max(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
