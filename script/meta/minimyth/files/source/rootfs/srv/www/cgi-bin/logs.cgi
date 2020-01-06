#!/usr/bin/perl

use warnings;
use strict;

use MiniMyth ();

require "/srv/www/cgi-bin/mm_webpage.pm";

my $minimyth  = new MiniMyth;
my $http_host = $ENV{'HTTP_HOST'};

my @middle = ();

push(@middle,  q(<div class="section">));
push(@middle,  q(  <p>));
if ($minimyth->var_get('MM_SECURITY_ENABLED') eq 'no')
{
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/mythfrontend">MythTV frontend log</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/messages">System log</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/settings">MiniMyth2 Settings</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/system-info">MiniMyth2 Diagnostic info</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/minimyth.err">MiniMyth2 Errors</li> ));
}
else
{
    push(@middle,  q(    Your system has security enabled.));
    push(@middle,  q(    Therefore, you cannot access your system's logs.));
}
push(@middle,  q(  </p>));
push(@middle,  q(</div>));

my $page = mm_webpage->page($minimyth, { 'title' => 'Logs and Diagnostics', 'middle' => \@middle });

print $_ . "\n" foreach (@{$page});

1;
