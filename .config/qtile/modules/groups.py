from libqtile.config import Group
from libqtile import layout


group_names = [
    ("DEV", {"layout": layout.Max()}),
    ("WWW", {"layout": layout.Max()}),
    ("SYS", {"layout": layout.Max()}),
    ("DOC", {"layout": layout.Max()}),
    ("GAME", {"layout": layout.Max()}),
    ("VID", {"layout": layout.Max()}),
]

groups = [Group(name, layout=layout.Max()) for name, kwargs in group_names]
[print(name, kwargs) for name, kwargs in group_names]
