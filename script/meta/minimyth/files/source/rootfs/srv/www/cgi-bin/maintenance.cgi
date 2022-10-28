#!/usr/bin/perl

use Shell;
use strict;
use warnings;
use feature 'switch';
use CGI qw(param);
use Sys::Hostname;
use Socket;

no if $] >= 5.018, warnings => "experimental";

my $command = "";
my $arg     = "";

if (param("command")) { $command = param("command"); }
if (param("arg"))     { $arg = param("arg");         }

my $output = '';
my $cmd = '';
my $last_cmd = '';

binmode(STDOUT, ":encoding(utf8)");

if ($command eq "show-log") {

    if ($arg) {
        if (-e "/var/log/$arg") {
            system("cat /var/log/$arg");
        } else {
            print "\nERROR: requested /var/log/$arg file does not exist!\n";
    }
    } else {
        print "\nERROR: missing filename argument!\n";
    }

} elsif ($command eq "mm_manage") {
    system("/usr/bin/mm_manage $arg");

} elsif ($command eq "execute") {
        if ($arg) {
            my @cmd = split(' ', $arg);
            if (-e "/usr/bin/$cmd[0]") {
                system("su -c \"/usr/bin/$arg 2>&1\"");
            } else {
                print "\nERROR: requested /usr/bin/$arg binary does not exist!\n";
            }
        } else {
            print "\nERROR: missing binary filename argument!\n";
        }
} else {

    my $my_ip_address = inet_ntoa((gethostbyname(hostname))[4]);
    if ($command) {
        print "\nERROR: unrecognized command!\n";
    } else {
      print <<EOT_help;
        <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
        <html>
          <Title> Examplary REST URLs</Title>
          <BR>Examplary URLs for accessing Logs:<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=mythfrontend.log">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=mythfrontend.log</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=messages">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=messages</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=online-update.log">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=online-update.log</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=settings">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=settings</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=system-info">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=system-info</a>
            </LI>
          </UL>
          <BR>Examplary URLs for managing this device<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_mythfrontend">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_mythfrontend</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_xserver">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_xserver</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_this_frontend">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=restart_this_frontend</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=install_updates">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=install_updates</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=shutdown_this_frontend">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=shutdown_this_frontend</a>
            </LI>
          </UL>
          <BR>Examplary URLs for launching binary or script<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=killall%20mythfrontend">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=killall%20mythfrontend</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_do_online_update%20doupdate">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_do_online_update%20doupdate</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_on">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_on</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_off">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_off</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=ps%20aux">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=ps%20aux</a>
            </LI>
          </UL>
        </html>
EOT_help
    }
}
