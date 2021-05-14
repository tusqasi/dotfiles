from libqtile import layout
from libqtile.config import Match


layout_default = {
        'border_focus': '#675d55',
        # 'border_normal':'#fe4cbb3',
        'border_focus_stack': '#881111',
        'margin': 15,
        'margin_on_single': 1,
        }
layouts = [
    layout.MonadTall(**layout_default),
    layout.Max(),
    # layout.Columns(
    #     # border_normal="#fe4cbb3",
    #     border_focus_stack='#fe4cbb3',
    #     ),
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
