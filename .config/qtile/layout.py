from libqtile import layout
from libqtile.config import Match


layouts = [
    layout.MonadTall(
        border_focus="#675d55",
        # border_normal="#fe4cbb3",
        margin=15,
    ),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
