from keys import keys
from libqtile.config import Key

for key in keys:
    if isinstance(key, Key):
        print(f"{' + '.join(key.modifiers)} + {key.key}\n>>> {key.desc}\n")
