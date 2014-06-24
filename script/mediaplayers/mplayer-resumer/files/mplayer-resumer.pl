#!/usr/bin/perl

use Shell;
use strict;
use POSIX qw(floor);

# Written by Bob Igo from the MythTV Store at http://MythiC.TV
# Email: bob@stormlogic.com
#
# If you run into problems with this script, please send me email

# PURPOSE:
# --------------------------
# This is a wrapper script to prove the concept of having MythTV
# resume playback of previously-stopped video where you left off.
# It's likely that a good solution will look different than this
# initial code.

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


my $infile;
my $resumefile;
my $mplayer_parameters;
my $fudge_factor=2; # number of additional seconds to skip back before playback
my $tnow;    # Time now.
my $tprev;   # Time the prog was last started. 
             # Returned from the modification time of the xx.resume file.
my $tdiff=5; # How many seconds before we should start from 
             # the beginning of the movie
#DEBUG
#open(DEBUG,">/tmp/debug") || die "unable to open debug file";

sub init () {
    $tnow = time();
    $infile = @ARGV[$#ARGV];

    $resumefile = &get_resume_filename($infile);
    # This returns the 9th element of the 13 element array 
    # created by the stat function.
    $tprev = (stat ($resumefile))[9]; 
    # if this file is restarted in less than 5 seconds then 
    # remove the .resume file
    if ( ($tnow - $tprev) < $tdiff ) {
        unlink($resumefile);
    }

    $mplayer_parameters = join(' ',@ARGV[0..$#ARGV-1]);
}

&init();
&save_time_offset(&mplayer($mplayer_parameters,$infile), $resumefile);

#close(DEBUG);

# For $pathname, return $path.$filename.resume
sub get_resume_filename () {
    my($pathname)=@_;
    
    my $idx = rindex($pathname,"/");

    if ($idx == -1) { # There was no "/" in $pathname
	return ".".$pathname.".resume";
    } else {
	# Now we need to split out the path from the filename.
	my $path = substr($pathname,0,$idx+1);
	my $filename = substr($pathname,$idx+1);
	return "$path.$filename.resume";
    }
}

# Calls mplayer and returns the last known video position
sub mplayer () {
    my($parameters,$infile)=@_;
    my $seconds=0;
    my $timecode=&get_time_offset($infile);
    my $command = "mplayer $parameters -ss $timecode \"$infile\" 2>&1 2>/dev/null |";

    open(SHELL, $command);
    # The kind of line we care about looks like this example:
    # A:1215.2 V:1215.2 A-V:  0.006 ct:  0.210 207/201 13%  0%  1.9% 0 0 68%
    # But all we care to look at is the first number.
    
    while (<SHELL>) {
	#print DEBUG $_;
	if (m/A: *[0-9]+\.[0-9]/) { # See if this line has timecodes on it
	    my $last_timecode_line = &extract_last_timecode_line($_);
	    if ($last_timecode_line =~ m/ *([0-9]+\.[0-9]) V/) {
		$seconds=$1;
	    }
	}
    }
    close(SHELL);

    return $seconds;

    sub extract_last_timecode_line () {
	my ($line)=@_;
	my @lines=split('A:',$line);
	return @lines[$#lines-1];
    }
}

# Save the last known video position
sub save_time_offset () {
    my($seconds, $resumefile)=@_;

    open(RESUMEFILE, ">$resumefile") || die "Unable to open $resumefile for writing";
    print RESUMEFILE "$seconds";
    close(RESUMEFILE);
}

# returns the number of seconds corresponding to the last known video position,
# in hh:mm:ss format, compatible with the "-ss" parameter to mplayer
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

    $timecode = sprintf "%02d:%02d:%02d",$hours,$minutes,$seconds;
#    print "TIMECODE: $timecode\n";
    return $timecode;
}

sub print_usage () {
    print "USAGE:\n";
    print "\t",$ARGV[0], "[mplayer parameters] video_file\n";
    print "\t","e.g. ",$ARGV[0], "-fs -zoom my.mpg\n";
    print "\t","Version 5/3/2006\n";
}
