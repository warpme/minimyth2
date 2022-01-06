#!/usr/bin/env python
# -*- coding: UTF-8 -*-
# vim: ts=4 sts=4 sw=4 tw=79 sta et
"""
An interface script for using lirc with mozilla-firefox, requires pylirc and xdotool
"""

__author__  = 'Patrick Butler, Piotr Oniszczuk'
__email__   = 'pbutler at killertux org, warpme at o2.pl'
__license__ = "GPLv2"

import subprocess
import sys
import pylirc
import time

def main(args):
    """
    Fires off Mozilla-firefox, then inits pylirc and waits for remote presses
    """
    xstatus = subprocess.Popen(["xset", "-q"], stdout = subprocess.PIPE)
    xstatus.wait()
    has_dpms = any(b'DPMS is Enabled' in line for line in xstatus.stdout)
    if has_dpms:
        subprocess.Popen(["xset", "-dpms"])
    try:
        browser(args)
    finally:
        if has_dpms:
            subprocess.Popen(["xset", "+dpms"])

def browser(args):
    browser = subprocess.Popen(["/usr/local/bin/mozilla-firefox/firefox"] + args[1:])

    time.sleep(5)

    p1 = subprocess.Popen(["xdotool", "search", "--name", "Mozilla Firefox"], stdout = subprocess.PIPE)
    p1.wait()
    windows = p1.stdout.readline().split()
    for window in windows:
        print ("'%s'" % window)
        subprocess.Popen(["xdotool", "windowfocus", str(window)])
        subprocess.Popen(["xdotool", "key", "F11"])

    try:
        if not pylirc.init("mozilla-firefox", "/etc/lirc/lircrc", 1):
            return "Failed"
        stop = False
        while not stop:
            codes = pylirc.nextcode(1)
            if codes is None:
                continue
            for code in codes:
                print (code)
                if code is None:
                    continue
                config = code["config"].split()
                if config[0] == "EXIT":
                    stop = True
                    break
                if config[0] == "mousestepreset":
                    mousestep = 0
                elif config[0] == "mousemove_relative":
                    if mousestep < 10:
                        mousestep += 1
                    config[2] = str(int(config[2]) * mousestep ** 2)
                    config[3] = str(int(config[3]) * mousestep ** 2)
                subprocess.Popen(["xdotool"] + config)
    except KeyboardInterrupt:
        print ("Exiting ...")
    p1 = subprocess.Popen(["xdotool", "search", "--name", "Mozilla Firefox"], stdout = subprocess.PIPE)
    p1.wait()
    windows = p1.stdout.readline().split()
    for window in windows:
        print ("'%s'" % window)
        subprocess.Popen(["xdotool", "windowfocus", str(window)])
        print ("Asking mozilla-firefox to exit by Ctrl+Shift+W ...")
        subprocess.Popen(["xdotool", "key", "Ctrl+Shift+W"])

    # If we found windows and they're still running, wait 3 seconds
    if len(windows) != 0 and browser.poll() is None:
        print ("Still waiting 3sec for eiting mozilla-firefox ...")
        for i in range(30):
            time.sleep(.1)
            if browser.poll() is not None:
                break
    # Okay now we can forcibly kill browser
    if browser.poll() is None:
        print ("Terminating mozilla-firefox ...")
        browser.terminate()

    return 0

if __name__ == "__main__":
    sys.exit( main( sys.argv ) )
