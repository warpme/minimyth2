#!/usr/bin/perl

# Written by Bob Igo from the MythTV Store at http://MythiC.TV
# Email: bob@stormlogic.com
# Extended by Piotr Oniszczuk warpme@o2.pl
# If you run into problems with this script, please send me email

# PURPOSE:
# --------------------------
# This is a wrapper script to prove the concept of having MythTV
# resume playback of previously-stopped video where you left off.
# It's likely that a good solution will look different than this
# initial code.
# Also - if VDPAU support is needed, script can parse content file,
# determine type of codec, and if vdpau supported codec is used by
# content - script will extend mplayer cmd line by appropriate -vc & -vo
# parameters.
# If host system has properly supported XrandR - script can also determine
# content fps and set refresh to appropriate value. After exiting mplayer
# refrest rate will be changed to default value.

# RATIONALE:
# --------------------------
# Watching 90% of a video and stopping causes you to return to the
# beginning again the next time you watch it.  Remembering where
# you were in the video and resuming at that position is a much nicer
# behavior for the user.
#
# By default, mplayer spits out timecode information that tells you
# where you are in the video, to the tenth of a second.  Mplayer also
# supports a seek feature on the command-line.  We can make use of these
# features to write an mplayer wrapper that will remember the last
# position in a video file and resume to it on playback.

# PARAMETERS:
# --------------------------
# see print_usage() below

# FILES:
# --------------------------
# $infile, the video to play
# $resumefile, the video's resume file (see get_resume_filename() below)

# KNOWN ISSUES:
# --------------------------
# Mplayer misreports the timecodes on .nuv MPEG-2 files.  Currently, anything
# captured via an HDTV tuner card and put into your /myth/video directory
# will fail with this resumer.
#
# Current theories include the timecode having to do with the show's broadcast
# time, recording time, or perhaps its upload time to the station that
# broadcast it.

# DESIGN LIMITATION:
# -------------------------
# If the video file to be played is on a read-only filesystem, or otherwise
# lives in a location that cannot be written to, resume will fail.  This is
# because the current implementation uses a file parallel to the video file
# to store the timecode.
#

# CHANGE LOG:
# 5/3/2006
# Added last time started checking.
# If this script is restarted within $tdiff (default 5 seconds)
# then it will delete the file used to keep track of the videos
# resume position.
#
# v1.1 3/01/2009 - Piotr Oniszczuk
# -Added VDPAU support.
# -Added mplayer executable name as config parameter (see config area)
# -Added mplayer default parameters (see config area)
# -Added script die when mplayer returns error
# -Fixing negative time code when saved time pos is lower than fudge_factor
#
# v1.2 8/03/2009 - Piotr Oniszczuk
# -Added XrandR support
# -Added possibility to selective turn on/off VDPAU & RandR support
#
# v1.3 13/07/2009 - Piotr Oniszczuk
# -Added central resume files storage. (see $put_resume_in_home and $resume_dir_loc in config area)
#
# v1.31 17/07/2009 - Piotr Oniszczuk
# -Added delete-before-write of resume file as workaround for cases where resume file is stored on samba share
#
# v1.4 04/10/2009 - Piotr Oniszczuk
# -Added disabling/enabling screensaver
# -Added refresh_rate declarations



# -----Config are BEGIN -------

my $ver="v1.4";
my $fudge_factor=2;                # number of additional seconds to skip back before playback
my $tdiff=5;                       # How many seconds before we should start from the beginning of the movie
my $vdpau_support=0;               # Set to 1 if script should add -vc xxxxvdpau and -vo vdpau for vdpau suported codecs
my $adjust_rrate=0;                # Set to 1 if script should use XrandR to change refresh to movie fps
my $ctrl_ss=1;                     # Set to 1 if script should disable/enable screensaver
my $default_rrate="50";            # Default refresh. Script will change to this refresh after exiting mplayer
my $put_resume_in_home=0;          # Set to 1 if script should store resume files in $home/.mplayer-resumer dir. When 0, script will use $resume_dir_loc
my $verbose=1;                     # Show basic info (codec, comand-line, etc)
my $mplayer="mplayer";             # Name of mplayer executable
my $xrandr="/usr/bin/xrandr";      # name and location od XrandR exec
my $resume_dir_loc="/myth/video";  # location for .mplayer-resumer dir where resume files will be stored (if put_resume_in_home is set to 0)
my $debug=0;                       # Set to 1 if debug info is needed
# my $mplayer_def_parameters="-heartbeat-cmd \"mm_ss_deactivate\" "; # default mplayer parameters
my $mplayer_def_parameters="-cache 8192 "; # default mplayer parameters
my $disable_ss="cp /home/minimyth/.xscreensaver /home/minimyth/.xscreensaver.enabled && sed -i 's/timeout:.*/timeout: 600/' /home/minimyth/.xscreensaver && xscreensaver-command -restart";
my $enable_ss="cp /home/minimyth/.xscreensaver.enabled /home/minimyth/.xscreensaver && xscreensaver-command -restart";


my $rrate_23_976="25";
my $rrate_23_978="25";
my $rrate_24_000="24";
my $rrate_25_000="25";
my $rrate_29_970="25";
my $rrate_30_000="30";
my $rrate_50_000="50";
my $rrate_59_940="50";
my $rrate_60_000="60";

#Refresh rates returnet by XrandR when TwinView is enabled
# "1920x1080@50"    ->50
# "1920x1080@60"    ->51
# "1920x1080@24"    ->52
# "1920x1080@23.976"->53
# "1920x1080@50i"   ->54
# "1920x1080@60i"   ->55
# "1920x1080@59.94" ->56
# "1920x1080@59.94i"->57
# "1920x1080@25"    ->58
# "1920x1080@29.97" ->59
# "1920x1080@30"    ->60

# -----Config are NND -------












use Shell;
use strict;
use warnings;
use POSIX qw(floor);
use Cwd qw(abs_path);
use feature 'switch';
my $infile;
my $resumefile;
my $mplayer_parameters;
my $tnow;
my $tprev;
my $container = 'unknown';
my $video_format = 'unknown';
my $video_codec = 'unknown';
my $video_bitrate = 'unknown';
my $video_height = 'unknown';
my $video_width = 'unknown';
my $video_fps = 'unknown';
my $video_aspect = 'unknown';
my $audio_codec = 'unknown';
my $audio_bitrate = 'unknown';
my $audio_channels = 'unknown';
my $audio_rate = 'unknown';
my $vcodec = ' ';
my $rrate = $default_rrate;

sub init () {
    $tnow = time();
    #$infile = @ARGV[$#ARGV];
    $infile = $ARGV[$#ARGV];
    $resumefile = &get_resume_filename($infile);
    $tprev = (stat ($resumefile))[9];
    if ( ($tnow - $tprev) < $tdiff ) {
        unlink($resumefile);
    }
    $mplayer_parameters = join(' ',@ARGV[0..$#ARGV-1]);
}

sub get_resume_filename () {
    my($pathname)=@_;
    $pathname=abs_path($pathname);
    die "File does not exist: $pathname" if (! -e $pathname);
    my $home=$resume_dir_loc;
    if ($put_resume_in_home) {
        $home=$ENV{'HOME'};
    }
    if ($home ne "") {
        $home=abs_path($home);
    }
    print ("Resume files dir will be in \"$home\"\n") if ($debug);
    die "Could not determine home directory" if ($home eq "");
    die "Home directory does not exist: $home" if (! -e $home);
    my $conf="$home/.mplayer-resumer";
    print ("Resume files will be stored in \"$conf\"\n") if ($debug);
#    mkdir("$conf", 0755) if (! -e $conf);
#    die "Could not create mplayer-resumer configuration directory: $conf" if (! -d $conf);
    $pathname=~s/\//~/g;
    $pathname=~s/ /_/g;
    $pathname="$conf/$pathname";
    return $pathname
}

sub set_rrate () {
    my $command = "$xrandr -r @_ 2>&1 |";
    print ("XrandR command will be \"$command\"\n") if ($debug);
    my $out = open(SHELL, $command);
    while (<SHELL>) {
        $out = $_;
        print ("XrandR output is: \"$out\"\n");
    }
    close(SHELL);
    return $out;
}

sub exec_command () {
    my $command = "@_ 2>&1 |";
    print ("Executing command: \"$command\"\n") if ($debug);
    my $out = open(SHELL, $command);
    while (<SHELL>) {
        $out = $_;
        print ("Command output is: \"$out\"\n");
    }
    close(SHELL);
    return $out;
}


# Set type of video codec if VDPAU is used. Function needs filename and
# returns "-vc xxxxvdpau". If codec is not suported by VDPAU, "-vc xv" is ret.
sub get_content_details () {
    my $file=@_;
    my $mplayeropts;
    my $refresh_rate;
    my @params;
    my $command = "$mplayer -identify -frames 0  \"$infile\" 2>&1 2>/dev/null |";
    my $out = open(SHELL, $command);
    while (<SHELL>) {
        $out = $_;
        if ($out =~ /ID_DEMUXER=(.*)/) { $container=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_FORMAT=(.*)/) { $video_format=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_CODEC=(.*)/) { $video_codec=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_BITRATE=(.*)/) { $video_bitrate=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_WIDTH=(.*)/) { $video_width=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_HEIGHT=(.*)/) { $video_height=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_FPS=(.*)/) { $video_fps=$1 };
        $out = $_;
        if ($out =~ /ID_VIDEO_ASPECT=(.*)/) { $video_aspect=$1 };
        $out = $_;
        if ($out =~ /ID_AUDIO_CODEC=(.*)/) { $audio_codec=$1 };
        $out = $_;
        if ($out =~ /ID_AUDIO_BITRATE=(.*)/) { $audio_bitrate=$1 };
        $out = $_;
        if ($out =~ /ID_AUDIO_NCH=(.*)/) { $audio_channels=$1 };
        $out = $_;
        if ($out =~ /ID_AUDIO_RATE=(.*)/) { $audio_rate=$1 };
    }
    close(SHELL);
    if ($debug) {
        print "container is    : $container\n";
        print "video format is : $video_format\n";
        print "video codec is  : $video_codec\n";
        print "video bitrate is: $video_bitrate\n";
        print "video height is : $video_height\n";
        print "video width is  : $video_width\n";
        print "video fps is    : $video_fps\n";
        print "video aspect is : $video_aspect\n";
        print "audio codes is  : $audio_codec\n";
        print "audio bitrate is: $audio_bitrate\n";
        print "audio ch.num is : $audio_channels\n";
        print "audio rate is   : $audio_rate\n";
    };
    print ("[mplayer-resumer-vdpau] Detected codec is: \"$video_codec\" \n")  if ($verbose);
    given ($video_codec) {
        when ($video_codec = "ffh264")  { $mplayeropts = " -vc ffh264vdpau -vo vdpau "; }
        when ($video_codec = "ffmpeg2") { $mplayeropts = " -vc ffmpeg12vdpau -vo vdpau "; }
        when ($video_codec = "ffwmv3")  { $mplayeropts = " -vc ffwmv3vdpau -vo vdpau "; }
        when ($video_codec = "ffvc1")   { $mplayeropts = " -vc ffvc1vdpau -vo vdpau "; }
        default { $mplayeropts = " -vc xv "; }
    }
    print ("[mplayer-resumer-vdpau] Added VDPAU options: \"$mplayeropts\" \n") if ($vdpau_support);
    print ("[mplayer-resumer-vdpau] Detected fps is: \"$video_fps\" \n")  if ($verbose);
    given ($video_fps) {
        when ($video_fps = "23.976")  { $refresh_rate = $rrate_23_976; }
        when ($video_fps = "23.978")  { $refresh_rate = $rrate_23_978; }
        when ($video_fps = "24.000")  { $refresh_rate = $rrate_24_000; }
        when ($video_fps = "25.000")  { $refresh_rate = $rrate_25_000; }
        when ($video_fps = "29.970")  { $refresh_rate = $rrate_29_970; }
        when ($video_fps = "30.000")  { $refresh_rate = $rrate_30_000; }
        when ($video_fps = "50.000")  { $refresh_rate = $rrate_50_000; }
        when ($video_fps = "59.940")  { $refresh_rate = $rrate_59_940; }
        when ($video_fps = "60.000")  { $refresh_rate = $rrate_60_000; }
        default { $refresh_rate = $default_rrate; }
    }
    print ("[mplayer-resumer-vdpau] Xrandr will change refresh to : $refresh_rate Hz\n") if ($debug);
    return @params = ($mplayeropts,$refresh_rate);
}

sub mplayer () {
    my($parameters,$infile)=@_;
    my $seconds=0;
    my $timecode=&get_time_offset($infile);
    my $command = "$mplayer $parameters -ss $timecode \"$infile\" 2>&1 2>/dev/null |";
    print ("[mplayer-resumer-vdpau] Invoked Mplayer commanline: \"$command\" \n") if ($verbose);
    open(SHELL, $command);
    while (<SHELL>) {
        if (m/A: *[0-9]+\.[0-9]/) { # See if this line has timecodes on it
            my $last_timecode_line = &extract_last_timecode_line($_);
            if ($last_timecode_line =~ m/ *([0-9]+\.[0-9]) V/) {
                $seconds=$1;
            }
        }
        if (m/Error/) {
            die "[mplayer-resumer-vdpau] Exit. Mplayer return following error: \n---------------------------\n$_ \n---------------------------\n";
        }
    }
    close(SHELL);
    return $seconds;
}

sub extract_last_timecode_line () {
    my ($line)=@_;
    my @lines=split('A:',$line);
    return $lines[$#lines-1];
}

sub save_time_offset () {
    my($seconds, $resumefile)=@_;
    unlink("$resumefile");
    open(RESUMEFILE, ">$resumefile") || die "Unable to open $resumefile for writing";
    print RESUMEFILE "$seconds";
    close(RESUMEFILE);
    print ("[mplayer-resumer-vdpau] Resume details stored in \"$resumefile\" file.\n") if ($verbose);
}

sub get_time_offset () {
    my($videofile)=@_;
    my($resumefile) = &get_resume_filename($videofile);
    my $seconds=0;
    my $timecode;
    open(RESUMEFILE, "<$resumefile") || return "00:00:00";
    while(<RESUMEFILE>) {
        $seconds=$_;
    }
    close(RESUMEFILE);
    my $hours = floor($seconds/3600);
    $seconds = $seconds - $hours*3600;
    my $minutes = floor($seconds/60);
    $seconds = int($seconds - $minutes*60) - $fudge_factor;
    if ($seconds < 0) {$seconds = 0};
    $timecode = sprintf "%02d:%02d:%02d",$hours,$minutes,$seconds;
    return $timecode;
}

sub print_usage () {
    print "USAGE:\n";
    print "\t",$ARGV[0], "[mplayer parameters] video_file\n";
    print "\t","e.g. ",$ARGV[0], "-fs -zoom my.mpg\n";
    print "\t","Version v1.3, 13/07/2009\n";
}


&init();
if ($vdpau_support || $adjust_rrate) { ($vcodec,$rrate)=&get_content_details($infile) };
if ($vdpau_support) {
    $mplayer_parameters = $mplayer_def_parameters.$mplayer_parameters.$vcodec;
}
else {
    $mplayer_parameters = $mplayer_def_parameters.$mplayer_parameters;
}
print ("[mplayer-resumer-vdpau] Mplayer parameters will be: \"$mplayer_parameters\"\n") if ($verbose);
if ($adjust_rrate) {
    print ("[mplayer-resumer-vdpau] Change via XrandR refresh-rate to $rrate Hz\n") if ($verbose);
    if ($rrate ne $default_rrate) { &set_rrate($rrate) };
}
if ($ctrl_ss) {
    print ("[mplayer-resumer-vdpau] Disabling screensaver\n") if ($verbose);
    &exec_command($disable_ss);
}    
&save_time_offset(&mplayer($mplayer_parameters,$infile), $resumefile);
if ($adjust_rrate) {
    print ("[mplayer-resumer-vdpau] Back via XrandR refresh-rate to $default_rrate Hz\n") if ($verbose);
    if ($rrate ne $default_rrate) { &set_rrate($default_rrate) };
}
if ($ctrl_ss) {
    print ("[mplayer-resumer-vdpau] Enabling back screensaver\n") if ($verbose);
    &exec_command($enable_ss);
}
