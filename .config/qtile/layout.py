from libqtile import layout
from libqtile.config import Match


layouts = [
    layout.MonadTall(
        border_focus="#675d55",
        # border_normal="#fe4cbb3", # don't use this
        margin=15,
    ),
    layout.MonadWide(
        border_focus="#675d55",
        margin=10,
    ),
    layout.Max(),
    # layout.VerticalTile(
    #     border_focus="#675d55",
    #     margin=10,
    #     ),
    # Try more layouts by unleashing below layouts.
    # layout.Tile(
    #     border_focus="#675d55",
    #     margin=10,
    #     add_on_top=False,
    #     ),
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.RatioTile(),
    # layout.TreeTab(),
    # layout.Zoomy(),
]
