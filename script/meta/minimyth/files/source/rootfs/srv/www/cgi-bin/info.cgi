#!/usr/bin/perl

use warnings;
use strict;

use File::Spec ();
use MiniMyth ();

require "/srv/www/cgi-bin/mm_webpage.pm";

my $minimyth   = new MiniMyth;
my $mm_version = $minimyth->var_get('MM_VERSION');
my $devnull    = File::Spec->devnull;



my @status_info_body = ();
my $status_info_head = q((output of command "inxi --full --audio --cpu --display --bluetooth --usb --network-advanced --color 0"));
if (system(qq(/usr/bin/inxi.sh > $devnull 2>&1)) == 0)
{
    if (open(FILE, '-|', '/usr/bin/inxi.sh'))
    {
        while (<FILE>)
        {
            chomp;
            push(@status_info_body, $_);
        }
        close(FILE);
    }
}
while (($#status_info_body >= 0) && ($status_info_body[0] eq ''))
{
    shift(@status_info_body);
}
while (($#status_info_body >= 0) && ($status_info_body[$#status_info_body] eq ''))
{
    pop(@status_info_body);
}



my @middle = ();

if (@status_info_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_info_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_info_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}

my $page = mm_webpage->page($minimyth, { 'title' => 'Info', 'middle' => \@middle , 'style' => [ '../css/status.css' ] });

print $_ . "\n" foreach (@{$page});

1;
