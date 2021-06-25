from libqtile.config import Group
from libqtile.command import lazy

group_names = [
    ("DEV", {"layout": "Max"}),
    ("WWW", {"layout": "Max"}),
    ("SYS", {"layout": "Max"}),
    ("DOC", {"layout": "Max"}),
    ("GAME", {"layout": "Max"}),
    ("VID", {"layout": "Max"}),
    # ("CHAT", {'layout': 'monadtall'}),
    # ("VBOX", {'layout': 'monadtall'}),
    # ("GFX", {'layout': 'floating'}),
]

groups = [Group(name, kwargs) for name, kwargs in group_names]

