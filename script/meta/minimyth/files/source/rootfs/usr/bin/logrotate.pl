#!/usr/bin/perl

#####
## perl-logrotate.pl by Aki Tossavainen <cmouse@youzen.ext.b2.fi> (c) 2004 
##
# Does a log file rotation as defined by config file.
# Does not break open logfiles, just truncates them. 
#
# If you find bugs or have suggestions, please email.
#
### Config file format
# Following keywords are supported by the config file
# 
## logfile <filename> 
# Defines a filename to rotate
#
## rotate-time <number> <hour(s)/day(s)/week(s)>
# Defines the time to wait before next rotation. If no unit is specified
# seconds is assumed!
#
## keep-files <number>
# Defines how many log files are kept. 5 means that you'll have files 0->4.
#
## compress <yes,1,no,0>
# Should the files be compressed. You need Compress::Zlib if you enable this
#
## status-file <filename>
# Where the rotation status will be written. 
#
## dryrun <yes,1,no,0>
# Whether the logs would be really rotated. This is defaulted to 1 unless
# you explicitly set it to no.
#
# Config file can have empty lines and comments beginning with #
# Do not add comments after config lines homever, that will break things.
####

use strict;

# Configuration file to use.
our $config_file = '/etc/logrotate.conf';

# Init variables
our @logfiles;

# no compression by default
our $compress = 1;

# dryrun - if people do not read config files...
our $dryrun = 1;

# 1 week.
our $rotate_time = 604800;

# 5 files
our $rotate_files = 5;

# locations
our $status_file = '/var/run/logrotate.status';

# to avoid complaints
our %status;

sub parse_time($) {
    my ($t) = @_;
    my @time = split / /,$t;
    return 0 if (@time == 0);
    return 0 if ($time[0] =~ /\D/);
    my $number = $time[0];
    if (@time > 1) {
	$number = $time[0];
	# we have some definition after the number
	# hours
	$number *= 3600 if ($time[1] eq 'hour');
        $number *= 3600 if ($time[1] eq 'hours');
	# days
	$number *= 86400 if ($time[1] eq 'day');
	$number *= 86400 if ($time[1] eq 'days');
	# weeks
	$number *= 604800 if ($time[1] eq 'week');
	$number *= 604800 if ($time[1] eq 'weeks');
    }
    return $number;
}
	    
sub parse_config($) {
    my ($file) = @_;
    open CONFIG,'<'.$file or die("Unable to open config file $file\n");
    while(<CONFIG>) {
	chomp;
	next if ($_[0] eq '#');
	my @line = split / /,$_,2;
	if (@line > 1) {
	    # they all take args
	    if ($line[0] eq 'compress') {
		if ($line[1] eq 'yes' || $line[1] eq '1') {
		    $compress = 1;
		    next;
		} elsif ($line[1] eq 'no' || $line[1] eq '0') {
		    $compress = 0;
		    next;
		}
		die("Invalid value for compress: must be one of yes,1,no,0");
	    }
	    if ($line[0] eq 'logfile') {
		push(@logfiles,$line[1]);
		next;
	    }
	    if ($line[0] eq 'rotate-time') {
		die("Invalid rotate-time '".$line[1]."'\n") if (($rotate_time = parse_time($line[1]))==0);
		next;
	    }
	    if ($line[0] eq 'keep-files') {
		die("Invalid keep-files") if ($line[1] =~ /\D/);
		$rotate_files = $line[1];
		next;
	    }
	    if ($line[0] eq 'status-file') {
		die("No status file given") if ($line[1] eq '');
		$status_file = $line[1];
		next;
	    }
	    if ($line[0] eq 'dryrun') {
                if ($line[1] eq 'yes' || $line[1] eq '1') {
                    $dryrun = 1;
                    next;
                } elsif ($line[1] eq 'no' || $line[1] eq '0') {
                    $dryrun = 0;
                    next;
                }
                die("Invalid value for dryrun: must be one of yes,1,no,0");
	    }
	} elsif (@line) {
	    die("All options have at least 1 parameter");
	}
    }
    close CONFIG;
}

parse_config($config_file);

if ($compress) {
    use Compress::Zlib;
}

# read status file
if (!-e $status_file) {
    open STATUS,'>'.$status_file or die("Unable to create status file\n");
    close STATUS;
}

open STATUS,'<'.$status_file or die("Unable to open status file\n");
while(<STATUS>) {
    chomp;
    my @line = split / /;
    if (@line == 2) {
	$status{$line[0]} = $line[1];
    }
}
close STATUS;

# now that we know what we are expected to do, we'll start
for my $logfile (@logfiles) {
    # first we try to read the entire log file into memory. then we 
    # instantly truncate it, 'move' all the existing logfiles +1 forward
    # and create possibly compressed .0.bz2 file.
    # simple eh? 
    # first we check the status file, maybe it doesn't need rotating as of yet
    next if (defined($status{$logfile}) && (time - $status{$logfile} < $rotate_time));
    # open file.
    print "Would rotate $logfile\n" if ($dryrun);
    if (open LOGFILE,'<'.$logfile) {
	# good... reel it in.
	my @data = <LOGFILE>;
	close LOGFILE;
	# if dryrun is one this should not execute.
	if (($dryrun == 1)||(open LOGFILE,'>',$logfile)) {
	    close LOGFILE if ($dryrun == 0);
	    # truncate worked. proceed.
	    my $str = join "",@data;
	    if ($compress) {
		$str = Compress::Zlib::memGzip($str);
	    }
	    # juggle files
	    for my $i (0..($rotate_files-2)) {
		# to avoid making keep-files + 1 files...
		my $n = $rotate_files - $i - 1;
		# if we use compressed files, we check this.
		if ($compress) {
		    if (-e $logfile.'.'.$n.'.gz') {
			if ($dryrun) {
			    print "Would unlink ".$logfile.'.'.$n.".gz\n";
			} else {
			    unlink $logfile.'.'.$n.'.gz';
			}
		    }
		    if ($dryrun) {
			print "Would rename ".$logfile.'.'.($n-1).'.gz to '.$logfile.'.'.$n.".gz\n";
		    } else {
			rename $logfile.'.'.($n-1).'.gz',$logfile.'.'.$n.'.gz';
		    }
		} else {
		    # and if not, this.
		    if (-e $logfile.'.'.$n) {
			if ($dryrun) {
                            print "Would unlink ".$logfile.'.'.$n."\n";
			} else {
			    unlink $logfile.'.'.$n;
			}
		    }
		    if ($dryrun) {
                        print "Would rename ".$logfile.'.'.($n-1)." to ".$logfile.'.'.$n."\n";
		    } else {
			rename $logfile.'.'.($n-1),$logfile.'.'.$n;
		    }
		}	   
	    }
	    # create the .0 file
	    if ($dryrun) {
		if ($compress) {
		    print "Would create ".$logfile.".0.gz\n";
		} else {
		    print "Would create ".$logfile.".0\n";
		}
	    } else {
		if ($compress) {
		    if (!(open LOGFILE,'>'.$logfile.'.0.gz')) {
			print "Unable to open $logfile.0.gz - placing it back to your logfile\n";
			open LOGFILE,'>>'.$logfile;
			print LOGFILE Compress::Zlib::memGunzip($str);
			close LOGFILE;
			next;
		    }
		} else {
		    if (!(open LOGFILE,'>'.$logfile.'.0')) {
			print "Unable to open $logfile.0.gz - placing it back to your logfile\n";
			open LOGFILE,'>>'.$logfile;
			print LOGFILE Compress::Zlib::memGunzip($str);
			close LOGFILE;
			next;
		    }
		}
		print LOGFILE $str;
		close LOGFILE;
	    }
	    # marking it rotated if it's really rotated.
	    $status{$logfile} = time;
	    # and that's it.
	} else {
	    print "Unable to truncate file $logfile\n";
	}
    } else {
	print "Unable to open file $logfile\n";
    }
}

if ($dryrun) {
    print "Would update status file\n";
} else {
# write status file.
    open STATUS,'>'.$status_file or die("Unable to write status information to $status_file\n");
    
    for my $logfile (@logfiles) {
	print STATUS $logfile.' '.$status{$logfile}."\n";
    }
    close STATUS;
}
