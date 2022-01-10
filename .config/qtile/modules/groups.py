from libqtile.config import Group


group_names = [
    ("DEV", {"layout": "Max"}),
    ("WWW", {"layout": "Max"}),
    ("SYS", {"layout": "Max"}),
    ("DOC", {"layout": "Max"}),
    ("GAME", {"layout": "Max"}),
    ("VID", {"layout": "Max"}),
]

groups = [Group(name, kwargs) for name, kwargs in group_names]
