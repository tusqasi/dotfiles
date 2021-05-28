from libqtile.config import Group

group_names = [
               ("DEV", {'layout': 'monadtall'}),
               ("WWW", {'layout': 'max'}),
               ("SYS", {'layout': 'monadtall'}),
               ("DOC", {'layout': 'max'}),
               ("GAME", {'layout': 'max'}),
               ("VID", {'layout': 'monadtall'}),
               # ("CHAT", {'layout': 'monadtall'}),
               # ("VBOX", {'layout': 'monadtall'}),
               # ("GFX", {'layout': 'floating'}),
               ]

groups = [Group(name, kwargs) for name, kwargs in group_names]


