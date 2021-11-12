#!/usr/bin/python -W ignore::DeprecationWarning
# -*- coding: UTF-8 -*-

import sys
import time
import re
import poplib
import socket
from imapclient import IMAPClient
from collections import defaultdict

debug = 1
cfg_file = "/etc/mailnotifier.rc"









if debug:
    print("\n\nMail notifier v1.1 (c) Piotr Oniszczuk\n\n")

argc = len(sys.argv)

if argc < 2:
    sleep = "60"
    if debug:
        print("Check period is:" + sleep + "sec.\n")
else:
    sleep = sys.argv[1]
    if debug:
        print("Check period is:" + sleep + "sec.\n\nInitial delaying of check by " + sleep + "sec.\n")
    time.sleep(int(sleep))

current_mails = defaultdict(int)

def send_osd (IP, TITLE, ORIGIN, DESCRIPTION, EXTRA, IMAGE, PROGRESS_TEXT, PROGRESS, TIMEOUT, STYLE):

    PORT = 6948

    MESSAGE = "\n<mythnotification version=\"1\">\n" + \
        "<image>"         + IMAGE         + "</image>\n" + \
        "<text>"          + TITLE         + "</text>\n" + \
        "<origin>"        + ORIGIN        + "</origin>\n" + \
        "<description>"   + DESCRIPTION   + "</description>\n" + \
        "<extra>"         + EXTRA         + "</extra>\n" + \
        "<progress_text>" + PROGRESS_TEXT + "</progress_text>\n" + \
        "<progress>"      + PROGRESS      + "</progress>\n" + \
        "<timeout>"       + TIMEOUT       + "</timeout>\n"
    if STYLE:
        MESSAGE = MESSAGE + "<style>" + STYLE + "</style>\n"

    MESSAGE = MESSAGE + "</mythnotification>"

    if debug:
        print("OSD_notify:")
        print("Target IP:", IP)
        print("Target port:", PORT)
        print("Message:", MESSAGE)

    sock = socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
    sock.sendto(bytes(MESSAGE, 'utf-8'), (IP, PORT))




while True:
    file = open(cfg_file,"r")
    lines = filter(None, (line.rstrip() for line in file))
    for line in lines:
        line = re.sub('\s*', "", line)
        if not re.search('^#|^;', line):
            line = re.sub('\n', "", line)
            x = line.split(",")
            type     = x[0]
            server   = x[1]
            login    = x[2]
            password = x[3]
            timeout  = x[4]
            ip       = x[5]
            picture  = x[6]

            if debug:
                print("Checking account:" + \
                "\n  type     : " + type + \
                "\n  server   : " + server + \
                "\n  login    : " + login + \
                "\n  password : " + password + \
                "\n  timeout  : " + timeout + \
                "\n  ip       : " + ip + \
                "\n  picture  : " + picture)

            cleanlogin = re.sub('\@', "-at-", login)

            if type == "imap":
                mailbox = "Inbox"
                imapserver = IMAPClient(server, use_uid=True, ssl=True)
                try:
                    imapserver.login(login, password)

                except:
                    print('Cant login to ' + login)
                    send_osd(ip, "Konto E-Mail:", "", "Nie mogę się zalogować do: " + login, "", picture, "", "", timeout, "")

                else:
                    if debug:
                        print('Logging in as ' + login)

                    select_info = imapserver.select_folder(mailbox)

                    if debug:
                        print('%d messages in INBOX' % select_info[b'EXISTS'])

                    folder_status = imapserver.folder_status(mailbox, b'UNSEEN')
                    newmails = int(folder_status[b'UNSEEN'])

                    if debug:
                        print("Account have", newmails, "new emails!")

                    if newmails > current_mails[cleanlogin]:
                        current_mails[cleanlogin] = newmails
                        if debug:
                            print("Sending notification about new emails!")
                        send_osd(ip, "Konto E-Mail:", "", str(newmails) + " nowych wiad.", picture, "", "", timeout, "", "")
                    else:
                        current_mails[cleanlogin] = newmails
                        if debug:
                            print("No notification about new emails!")

            if (type == "pop3" or type == "pop3ssl"):
                if type == "pop3ssl":
                    pop3server = poplib.POP3(server)
                else:
                    pop3server = poplib.POP3_SSL(server)

                try:
                    pop3server.user(login)
                    pop3server.pass_(password)
                    stat = pop3server.stat()

                except:
                    print('Cant login to ' + login)
                    send_osd(ip, "Konto E-Mail:", "", "Nie mogę się zalogować do: " + login, "", picture, "", "", timeout, "")

                else:
                    newmails = stat[0]

                    if debug:
                        print("Account have", newmails, "new emails!")

                    if newmails > current_mails[cleanlogin]:
                        if debug:
                            print("Sending notification about new emails!")
                        current_mails[cleanlogin] = newmails
                        send_osd(ip, "Konto E-Mail:", "", login + "@" + server, str(newmails) + " nowych wiad.", picture, "", "", timeout, "")
                    else:
                        current_mails[cleanlogin] = newmails
                        if debug:
                            print("No notification about new emails!")


    if debug:
        print(current_mails)

    time.sleep(int(sleep))

