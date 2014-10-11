#!/usr/bin/python

import sys
import pjsua as pj
import threading
import os
import glob
import os.path
import time
import re
import socket
import telnetlib
import datetime

interactive                  = 0
debug                        = 0
log_level                    = 3
rtp_port                     = 10000
config_cfg                   = "/etc/sip-daemon.conf"
semaphores_path              = "/tmp"
no_vad                       = -1
quality                      = 10






current_call = None
play_voice_mail = 0
fe_is_paused = 0

def log(str):
    now = time.time()
    localtime = time.localtime(now)
    milliseconds = '%03d' % int((now - int(now)) * 1000)
    timestamp = time.strftime('%H:%M:%S', localtime) + "." + milliseconds
    print timestamp + " " + str


log("SIP Telephony Daemon v1.4 (c) Piotr Oniszczuk\n")

def LoadConfig( cfg_file ):
    file = open(cfg_file,"r")
    lines = filter(None, (line.rstrip() for line in file))
    config = {}
    for line in lines:
        line = re.sub('\s*', "", line)
        if not re.search('^#|^;', line):
            line = re.sub('\n', "", line)
            x = line.split("=")
            a = x[0]
            b = x[1]
            config[a] = b
            if debug:
                print cfg_file + ": " + a + "=" + b
    return config;

def SendOSDNotify( title, origin, description, extra, image, progress_text, progress, timeout, style, fe_ip ):
    msg = "<mythnotification version=\"1\"><image>"+image+"</image><text>"+title+"</text><origin>"+origin+"</origin><description>"+description+"</description><extra>"+extra+"</extra><progress_text>"+progress_text+"</progress_text><progress>"+progress+"</progress><timeout>"+timeout+"</timeout>"
    if style:
        msg = msg + "<style>" + style + "</style>"
    msg = msg + "</mythnotification>"
    fe_port = 6948
    if debug:
        print "UDP target IP:", fe_ip
        print "UDP target port:", fe_port
        print "message:", msg
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.sendto(msg, (fe_ip, fe_port))

def QueryFELoc():
    tn = telnetlib.Telnet("127.0.0.1", 6546)
    tn.read_until("#")
    tn.write("query location\n")
    tn.write("exit\n")
    loc = tn.read_all()
    tn.close()
    return loc;

def TelnetCmdToFE(cmd):
    tn = telnetlib.Telnet("127.0.0.1", 6546)
    tn.read_until("#")
    tn.write(cmd+"\n")
    tn.write("exit\n")
    tn.close()



config = LoadConfig(config_cfg)

sip_registrar                = config["sip_registrar"]
user                         = config["user"]
password                     = config["password"]
voicemail_ann                = config["voice_mail_ann"]
voicemail_recording_pref     = config["voicemail_recording_pref"]
audio_dev_in                 = int(config["audio_dev_in"])
audio_dev_out                = int(config["audio_dev_out"])
snd_clock_rate               = int(config["snd_clock_rate"])
ptime                        = int(config["snd_ptime"])
echo_cancel_type             = int(config["echo_cancel_type"])
echo_cancel_tail             = int(config["echo_cancel_tail"])
incomming_call_image         = config["incomming_call_image"]
incoming_call_osd_timeout    = config["incoming_call_osd_timeout"]
incoming_call_osd_style      = config["incoming_call_osd_style"]
ongoing_call_image           = config["ongoing_call_image"]
ongoing_call_osd_timeout     = config["ongoing_call_osd_timeout"]
ongoing_call_osd_style       = config["ongoing_call_osd_style"]
voicemail_call_image         = config["voicemail_call_image"]
voicemail_call_osd_timeout   = config["voicemail_call_osd_timeout"]
voicemail_call_osd_style     = config["voicemail_call_osd_style"]
end_call_image               = config["end_call_image"]
end_call_osd_timeout         = config["end_call_osd_timeout"]
end_call_osd_style           = config["end_call_osd_style"]
tmo_mainmenu_begin_call      = float(config["tmo_mainmenu_begin_call"])
sip_domain                   = sip_registrar

#fe_video_playback_pause_cmd  = config["fe_video_playback_pause_cmd"]
#fe_video_playback_resume_cmd = config["fe_video_playback_resume_cmd"]
#fe_jump_to_mainmenu          = config["fe_jump_to_mainmenu"]
fe_video_playback_pause_cmd  = "key p\n"
fe_video_playback_resume_cmd = "key p\n"
fe_jump_to_mainmenu          = "jump mainmenu"

print "Current config:"
print "  -user               : " + user
print "  -password           : " + password
print "  -SIP registrar      : " + sip_registrar
print "  -Audio Dev. IN      : " + str(audio_dev_in)
print "  -Audio Dev. OUT     : " + str(audio_dev_out)
print "  -Voicemail ann.     : " + voicemail_ann
print "  -Voicemail rec.pref.: " + voicemail_recording_pref
if snd_clock_rate != -1:
    print "  -Sound CLK.rate    : " + str(snd_clock_rate)
if ptime != -1:
    print "  -pTime             : " + str(ptime)
if echo_cancel_type != -1:
    print "  -Echo Cancel Type  : " + str(echo_cancel_type)
if echo_cancel_tail != -1:
    print "  -Echo Cancel Tail  : " + str(echo_cancel_tail)
print " "

for filePath in glob.glob(semaphores_path + "/*.sem"):
    if os.path.isfile(filePath):
        if debug:
          log("Deleting semaphore:" + filePath)
        os.remove(filePath)

def log_cb(level, str, len):
    print str,

class MyAccountCallback(pj.AccountCallback):
    sem = None

    def __init__(self, account):
        pj.AccountCallback.__init__(self, account)

    def wait(self):
        self.sem = threading.Semaphore(0)
        self.sem.acquire()

    def on_reg_state(self):
        if self.sem:
            if self.account.info().reg_status >= 200:
                self.sem.release()

    def on_incoming_call(self, call):
        global current_call, fe_is_paused, phone

        if current_call:
            call.answer(486, "Busy")
            return

        log("Incoming call from:" + call.info().remote_uri)
        if not interactive:
            log("Put pickup.sem to answer or hangup.sem to hangup...")

        current_call = call
        call_cb = MyCallCallback(current_call)
        current_call.set_callback(call_cb)
        current_call.answer(180)

        uri = call.info().remote_uri
        phone = re.sub('<|>|\s|sip:|@.*', "", uri)
        SendOSDNotify( "TELEFON...", "Przychodzace polaczenie", "Tel: "+phone, "[1]:Rozmowa [2/3]:Voice-mail [4]:Odrzuc/Zakoncz", incomming_call_image, "", "", incoming_call_osd_timeout, incoming_call_osd_style, "127.0.0.1" )

        loc = QueryFELoc()
        if debug:
            log("FE query loc.returns:" + loc)

        result = re.search("Playback LiveTV|Playback Recorded|Playback Video|Playback DVD", loc)
        if result:
            log("FE is in video playback. Checking state...")
            state = re.search("pause", loc)
            if state:
                log("FE is paused...")
                fe_is_paused = 0
            else:
                log("FE is playing. Pausing playback...")
                fe_is_paused = 1
                TelnetCmdToFE(fe_video_playback_pause_cmd)


class MyCallCallback(pj.CallCallback):
    media_opened = 0

    def __init__(self, call=None):
        pj.CallCallback.__init__(self, call)

    def on_state(self):
        global current_call, fe_is_paused, phone, recorder_id
        log("Call_with=" + self.call.info().remote_uri + ", Call_state=" + self.call.info().state_text + ", Last_code=" + str(self.call.info().last_code) + "(" + self.call.info().last_reason + ")")

        if self.call.info().state == pj.CallState.DISCONNECTED:
            current_call = None

            log("Current call is:" + str(current_call))
            SendOSDNotify( "TELEFON...","", "Zakonczono polaczenie", "", end_call_image,"","", end_call_osd_timeout, end_call_osd_style, "127.0.0.1" )

            if fe_is_paused:
                log("FE was paused. Resuming playback...")
                TelnetCmdToFE(fe_video_playback_resume_cmd)
                fe_is_paused = 0

            if play_voice_mail:
                lib.recorder_destroy(recorder_id)
                log("Closing Voice-mail recorder...")


    def on_media_state(self):
        global lib, voice_mail_ann, voicemail_recording, recorder_id
        if self.call.info().media_state == pj.MediaState.ACTIVE:
            log("Media now are opened...")

            if not self.media_opened:
                self.media_opened = 1

                if os.path.isfile(semaphores_path + "/make-call-*.sem"):
                    os.remove(semaphores_path + "/make-call-*.sem")
                if os.path.isfile(semaphores_path + "/pickup.sem"):
                    os.remove(semaphores_path + "/pickup.sem")
                if os.path.isfile(semaphores_path + "/voice-mail.sem"):
                    os.remove(semaphores_path + "/voice-mail.sem")
                if os.path.isfile(semaphores_path + "/voice-mail-listen.sem"):
                    os.remove(semaphores_path + "/voice-mail-listen.sem")
                if os.path.isfile(semaphores_path + "/reject.sem"):
                    os.remove(semaphores_path + "/reject.sem")
                if os.path.isfile(semaphores_path + "/hangup.sem"):
                    os.remove(semaphores_path + "/hangup.sem")

                call_slot = self.call.info().conf_slot

                if (play_voice_mail == 1 or play_voice_mail == 2):
                    log("Starting voice-mail!")

                    player_id = lib.create_player(voicemail_ann, loop=0)
                    player_slot = lib.player_get_slot(player_id)
                    date = datetime.datetime.today()

                    timestamp = date.strftime('%d-%b-%Y-%H-%M')
                    vmfile = voicemail_recording_pref + "-" + timestamp + ".wav"
                    log("Creating Voice-mail recorder. Will record to:" + vmfile)

                    recorder_id = lib.create_recorder(vmfile)
                    recorder_slot = lib.recorder_get_slot(recorder_id)

                    lib.conf_connect(call_slot, recorder_slot)
                    lib.conf_connect(player_slot, call_slot)

                    if play_voice_mail == 2:
                        log("Connecting playback device to speakers...")
                        lib.conf_connect(call_slot, audio_dev_out)

                else:
                    log("You can talk!")

                    lib.conf_connect(call_slot, audio_dev_out)
                    lib.conf_connect(audio_dev_in, call_slot)

            else:
                log("Media already opened...")

        else:
            self.media_opened = 0

            if play_voice_mail:
                lib.recorder_destroy(recorder_id)
                log("Closing Voice-mail recorder...")

            log("Media are closed...")


def make_call(uri):
    try:
        log("Making call to:" + uri)
        return acc.make_call(uri, cb=MyCallCallback())
    except pj.Error, e:
        log("Exception: " + str(e))
        return None

lib = pj.Lib()

try:
    ua_cfg = pj.UAConfig()

    loging_cfg = pj.LogConfig()
    loging_cfg.level = log_level
    loging_cfg.callback = log_cb

    media_cfg = pj.MediaConfig()
    if snd_clock_rate != -1:
        media_cfg.clock_rate = snd_clock_rate
    if ptime != -1:
        media_cfg.ptime = ptime
    if echo_cancel_type != -1:
        media_cfg.ec_options = echo_cancel_type
    if echo_cancel_tail != -1:
        media_cfg.ec_tail_len = echo_cancel_tail
    if no_vad != -1:
        media_cfg.no_vad = no_vad
    if quality != -1:
        media_cfg.quality = quality

    lib.init(ua_cfg, loging_cfg, media_cfg)

    lib.set_snd_dev(audio_dev_in, audio_dev_out)

    my_transport_cfg = pj.TransportConfig()
    my_transport_cfg.port = rtp_port
    transport = lib.create_transport(pj.TransportType.UDP, my_transport_cfg)

    lib.start()

    my_account_cfg = pj.AccountConfig(sip_registrar, user, password)
    acc = lib.create_account(my_account_cfg)

    acc_cb = MyAccountCallback(acc)
    acc.set_callback(acc_cb)
    acc_cb.wait()

    log("Registration complete, status=" + str(acc.info().reg_status) + "(" + str(acc.info().reg_reason) + ")")

    if interactive:

        while True:
            print "\n\nMenu:\n  m=make call\n  h=hangup call\n  a=answer call\n  v=voice-mail\n  q=quit\n\n"

            input = sys.stdin.readline().rstrip("\r\n")

            if input == "m":
                print "Enter destination URI to call: ", 

                if current_call:
                    print "Already have another call"
                    continue

                input = sys.stdin.readline().rstrip("\r\n")
                if input == "":
                    continue
                input = "sip:" + input + "@" + sip_domain
                lck = lib.auto_lock()
                current_call = make_call(input)
                del lck

            elif input == "h":
                print "Hanging-up call..."

                if not current_call:
                    print "There is no call"
                    continue

                play_voice_mail = 0
                current_call.hangup()

            elif input == "a":
                print "Aswering call..."

                if not current_call:
                    print "There is no call"
                    continue

                play_voice_mail = 0
                current_call.answer(200)

            elif input == "v":
                print "Redirecting to voice-mail..."

                if not current_call:
                    print "There is no call"
                    continue

                play_voice_mail = 1
                current_call.answer(200)

            elif input == "q":
                print "Exiting..."
                break

        transport = None
        acc.delete()
        acc = None
        lib.destroy()
        lib = None
        sys.exit(0)

    else:

        while True:
            if os.path.isfile(semaphores_path + "/exit.sem") and os.access(semaphores_path + "/exit.sem", os.R_OK):
                os.remove(semaphores_path + "/exit.sem")

                log("exit.sem detected. Exiting...")
                transport = None
                acc.delete()
                acc = None
                lib.destroy()
                lib = None
                os.system("killall -9 sip-daemon.sh")
                sys.exit(0)

            elif glob.glob(semaphores_path + "/make-call-*.sem"):

                play_voice_mail = 0

                for filePath in glob.glob(semaphores_path + "/make-call-*.sem"):

                    if os.path.isfile(filePath):
                        if debug:
                            log("Deleting semaphore:" + filePath)
                        os.remove(filePath)

                    number = re.sub(semaphores_path, "", filePath)
                    number = re.sub('make-call-|/|.sem|', "", number)

                    if current_call:
                        log("Ending current call and making new call to:" + number)
                        current_call.hangup()
                        SendOSDNotify( "TELEFON...", "Wykonuje polaczenie", "Numer: "+number,"Klawisz [4] - koniec", ongoing_call_image,"","", ongoing_call_osd_timeout, ongoing_call_osd_style, "127.0.0.1" )
                        time.sleep(2)
                    else:
                        SendOSDNotify( "TELEFON...", "Wykonuje polaczenie", "Numer: "+number,"Klawisz [4] - koniec", ongoing_call_image,"","", ongoing_call_osd_timeout, ongoing_call_osd_style, "127.0.0.1" )

                    number = "sip:" + number + "@" + sip_domain
                    number = re.sub('\n|-', "", number)

                    lck = lib.auto_lock()
                    current_call = make_call(number)
                    del lck


            elif os.path.isfile(semaphores_path + "/pickup.sem") and os.access(semaphores_path + "/pickup.sem", os.R_OK):
                os.remove(semaphores_path + "/pickup.sem")

                if not current_call:
                    log("There is no call")
                    continue

                play_voice_mail = 0

                SendOSDNotify( "TELEFON...","", "Przyjecie polaczenia", "Numer: "+phone, ongoing_call_image,"","", ongoing_call_osd_timeout, ongoing_call_osd_style, "127.0.0.1" )

                log("Will pickup Call. Exiting FE to MainMenu...")
                TelnetCmdToFE(fe_jump_to_mainmenu)

                time.sleep(tmo_mainmenu_begin_call)

                current_call.answer(200)

            elif os.path.isfile(semaphores_path + "/voice-mail.sem") and os.access(semaphores_path + "/voice-mail.sem", os.R_OK):
                os.remove(semaphores_path + "/voice-mail.sem")

                if not current_call:
                    log("There is no call")
                    continue

                play_voice_mail = 1

                SendOSDNotify( "TELEFON...","", "Poczta glosowa", "", voicemail_call_image,"","", voicemail_call_osd_timeout, voicemail_call_osd_style, "127.0.0.1" )

                current_call.answer(200)

                if fe_is_paused:
                    log("FE was paused. Resuming playback...")
                    TelnetCmdToFE(fe_video_playback_resume_cmd)
                    fe_is_paused = 0


            elif os.path.isfile(semaphores_path + "/voice-mail-listen.sem") and os.access(semaphores_path + "/voice-mail-listen.sem", os.R_OK):
                os.remove(semaphores_path + "/voice-mail-listen.sem")

                if not current_call:
                    log("There is no call")
                    continue

                play_voice_mail = 2

                SendOSDNotify( "TELEFON...","", "Poczta glosowa", "", voicemail_call_image,"","", voicemail_call_osd_timeout, voicemail_call_osd_style, "127.0.0.1" )

                log("Will voice-mail and listen call. Exiting FE to MainMenu...")
                TelnetCmdToFE(fe_jump_to_mainmenu)

                time.sleep(tmo_mainmenu_begin_call)

                current_call.answer(200)


            elif os.path.isfile(semaphores_path + "/reject.sem") and os.access(semaphores_path + "/reject.sem", os.R_OK):
                os.remove(semaphores_path + "/reject.sem")

                if not current_call:
                    log("There is no call")
                    continue

                play_voice_mail = 0

                SendOSDNotify( "TELEFON...","", "Odrzucenie polaczenia", "","images/mythnotify/phone-hangoff.png","","", "10","", "127.0.0.1" )

                current_call.answer(603)


            elif os.path.isfile(semaphores_path + "/hangup.sem") and os.access(semaphores_path + "/hangup.sem", os.R_OK):
                os.remove(semaphores_path + "/hangup.sem")

                if not current_call:
                    log("There is no call")
                    continue

                play_voice_mail = 0

                SendOSDNotify( "TELEFON...","", "Koncze polaczenie", "", end_call_image,"","", end_call_osd_timeout, end_call_osd_style, "127.0.0.1" )

                current_call.hangup()

            time.sleep(0.5)

except pj.Error, e:
    log("Exception: " + str(e))

    transport = None
    acc.delete()
    acc = None
    lib.destroy()
    lib = None
    sys.exit(1)
