from libqtile import layout
from libqtile.config import Match


# layout_default = {
#         'border_focus': '#675d55',
#         'border_normal':'#fe4cbb3',
#         'border_focus_stack': '#881111',
#         'margin': 5,
#         'margin_on_single': 0,
#         }
layouts = [
    layout.Columns(
        # border_normal="#fe4cbb3",
        border_focus_stack='#fe4cbb3',
        ),
    layout.Max(),
    # layout.MonadTall(**layout_default),
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
