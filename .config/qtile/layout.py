from libqtile import layout
from libqtile.config import Match

layout_default = {
    "border_focus": "#504945",
    "border_normal": "#282828",
    # "margin": 50,
}
layouts = [
    layout.MonadTall(**layout_default),
    layout.MonadWide(**layout_default),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.VerticalTile(),
    # layout.Tile(),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.Zoomy(),
]
