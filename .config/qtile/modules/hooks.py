from libqtile import hook
import subprocess
from .variables import startup_script


@hook.subscribe.client_new
def send_to_www(window):
    windowtype = window.window.get_wm_class()[1]
    browsers = ["firefox", "brave", "chromium", "qutebrowser"]
    for browser in browsers:
        if windowtype.lower().find(browser) > -1:
            window.togroup("WWW")


@hook.subscribe.startup_once
def autostart():
    subprocess.call([startup_script])
