from libqtile.config import Group
from libqtile.command import lazy

group_names = [
    ("DEV", {"layout": "max"}),
    ("WWW", {"layout": "max"}),
    ("SYS", {"layout": "max"}),
    ("DOC", {"layout": "max"}),
    ("GAME", {"layout": "max"}),
    ("VID", {"layout": "max"}),
    # ("CHAT", {'layout': 'monadtall'}),
    # ("VBOX", {'layout': 'monadtall'}),
    # ("GFX", {'layout': 'floating'}),
]

groups = [Group(name, kwargs) for name, kwargs in group_names]

lazy.group["WWW"].toscreen()
