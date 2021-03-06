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
if ($minimyth->var_get('MM_SECURITY_ENABLED') eq 'yes')
{
    push(@middle,  q(    Your system has security enabled.));
    push(@middle,  q(    Therefore, you cannot access your system's logs.));
}
else
{
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/mythfrontend.log">Mythfrontend Log</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/messages">System Log</li> ));
    if (system(qq(rm -f /var/log/dmesg ; dmesg > /var/log/dmesg)) == 0) {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/dmesg">Kernel dmesg</li> ));
    }
    if (-e "/var/log/weston.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/weston.log">Weston Log</li> ));
    }
    if (-e "/var/log/Xorg.0.0.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/Xorg.0.0.log">Xorg Log</li> ));
    }
    if (-e "/var/log/sip-daemon") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/sip-daemon">SIP Daemon Log</li> ));
    }
    if (-e "/var/log/iwctl-wlan0.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/iwctl-wlan0.log">WLAN Connection Log</li> ));
    }
    if (-e "/var/log/online-update.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/online-update.log">On-Line Update Log</li> ));
    }
    if (-e "/var/log/makemkv.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/makemkv.log">MakeMKV Log</li> ));
    }
    if (-e "/var/log/init.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/init.log">Init Scripts Flow</li> ));
    }
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/settings">MiniMyth2 Settings</li> ));
    push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/system-info">MiniMyth2 Diagnostic Info</li> ));
    if (-e "/var/log/minimyth.err") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/minimyth.err">MiniMyth2 Errors</li> ));
    }
    if (-e "/var/log/minimyth.log") {
        push(@middle, qq(    <li><a href="http://$http_host:8080/var/log/minimyth.log">MiniMyth2 Log</li> ));
    }
}
push(@middle,  q(  </p>));
push(@middle,  q(</div>));

my $page = mm_webpage->page($minimyth, { 'title' => 'Logs and Diagnostics', 'middle' => \@middle });

print $_ . "\n" foreach (@{$page});

1;
