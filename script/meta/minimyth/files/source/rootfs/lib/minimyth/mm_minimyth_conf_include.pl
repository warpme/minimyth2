#!/usr/bin/perl

use strict;
use warnings;

use MiniMyth ();

my $remote_file = shift;

my $local_file = "/etc/minimyth.d/$remote_file";
$local_file =~ s/\/\/+/\//g;
$local_file =~ s/\/$//;

if (! -e $local_file)
{
     my $minimyth = new MiniMyth;
     $minimyth->var_load();

     $minimyth->confro_get($remote_file, $local_file);
}

print $local_file . "\n";

1;
