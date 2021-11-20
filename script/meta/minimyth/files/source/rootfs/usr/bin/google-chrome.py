#!/usr/bin/env python
# -*- coding: UTF-8 -*-
"""
An interface script for using lirc with google-chrome, requires pylirc and xdotool
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
    Fires off Google-chrome, then inits pylirc and waits for remote presses
    """
    xstatus = subprocess.Popen(["xset", "-q"], stdout = subprocess.PIPE)
    xstatus.wait()
    has_dpms = any("DPMS is Enabled" in line for line in xstatus.stdout)
    if has_dpms:
        subprocess.Popen(["xset", "-dpms"])
    try:
        browser(args)
    finally:
        if has_dpms:
            subprocess.Popen(["xset", "+dpms"])

def browser(args):
    browser = subprocess.Popen(["/usr/local/bin/google-chrome/chrome"] + args[1:])
    try:
        if not pylirc.init("google-chrome", "/etc/lirc/lircrc", 1):
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
        print ("Exiting by keyb Ctrl+C....")
    p1 = subprocess.Popen(["xdotool", "search", "--name", "Google Chrome"], stdout = subprocess.PIPE)
    p1.wait()
    windows = p1.stdout.readline().split()
    for window in windows:
        print ("'%s'" % window)
        subprocess.Popen(["xdotool", "windowfocus", str(window)])
        print ("Asking google chrome to exit by ctrl+shift+q....")
        subprocess.Popen(["xdotool", "key", "ctrl+shift+q"])

    # If we found windows and they're still running, wait 3 seconds
    if len(windows) != 0 and browser.poll() is None:
        print ("Still waiting 3sec for eiting google chrome....")
        for i in range(30):
            time.sleep(.1)
            if browser.poll() is not None:
                break
    # Okay now we can forcibly kill browser
    if browser.poll() is None:
        print ("Terminating google chrome....")
        browser.terminate()

    return 0

if __name__ == "__main__":
    sys.exit( main( sys.argv ) )
