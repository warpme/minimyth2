#!/usr/bin/perl

use Shell;
use strict;
use warnings;
use feature 'switch';
use CGI qw(param);
use Sys::Hostname;
use Socket;

no if $] >= 5.018, warnings => "experimental";

my @process_manage_commands = (
["restart_mythfrontend","Restart mythfrontend Process"],
["restart_xserver","Restart Xserver"],
["restart_mythbackend","Restart mythbackend Process"],
);

my @device_manage_commands = (
["restart_this_frontend","Reboot this device"],
["shutdown_this_frontend","Shitdown this device"],
);

my @misc_manage_commands = (
["save_themecache","Save theme cache"],
["save_cookiejar","Save webbrowser cookies"],
["restore_webbrowsers_state","Save external browser state"],
["save_game","Save Games State"],
["restore_game","Restore Games State"],
["reload_voip_config","Reload VoIP config/data"],
["redownload_theme","Redownload Theme"],
["check_updates","Check for Updates"],
["install_updates","Install Updates"],
["check_mythtv_db","Check mythtv DB consistency"],
);

my @hw_related_commands = (
["test_network_speed","Test Network Speed"],
["test_storage_speed","Test Storage Speed"],
["send_sysinfo","Send system info"],
);

my @optical_disk_manage_commands = (
["bluray_rip_start","Start BluRay Ripping"],
["bluray_copy_start","Start BluRay Copying"],
["bluray_rip_progress","Show BluRay Rip/Copy progress"],
["bluray_rip_stop","Stop BluRay Rip/Copy "],
["eject_optical_drive","Eject BluRay Disc"],
);

my @bt_manage_commands = (
["save_bt_connections","Remember current BT connections"],
["connect_all_bt_devices","Reconnect all BT devices"],
["show_bt_connections","Show all connected BT devices"],
);


my $command = "";
my $arg     = "";
# for testing
#$command = "show-log";
#$arg     = "mythfrontend.log";

if (param("command")) { $command = param("command"); }
if (param("arg"))     { $arg = param("arg");         }

my $output = '';
my $cmd = '';
my $last_cmd = '';

binmode(STDOUT, ":encoding(utf8)");

if ($command eq "show-log") {
    if ($arg) {
        if (-e "/var/log/$arg") {
            system("su -c \"/bin/cat /var/log/$arg 2>&1\"");
        } else {
            print "\nERROR: requested /var/log/$arg file does not exist!\n";
        }
    } else {
        print "\nERROR: missing filename argument!\n";
    }

} elsif ($command eq "mm_manage") {
    system("nohup su -c \"/usr/bin/mm_manage $arg > /dev/null 2>&1 &\"");
    print "\n[mm_manage $arg] launched in background ...\n\nYou can press browser BACK button to return\n";

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

} elsif ($command eq "launch") {
        if ($arg) {
            my @cmd = split(' ', $arg);
            if (-e "/usr/bin/$cmd[0]") {
                system("nohup su -c \"/usr/bin/$arg > /dev/null 2>&1 &\"");
                print "\n[/usr/bin/$arg] launched in background ...\n\nYou can press browser BACK button to return\n";
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

    require "/srv/www/cgi-bin/mm_webpage.pm";

    my $minimyth  = new MiniMyth;
    my $http_host = $ENV{'HTTP_HOST'};

    my @middle = ();

    push(@middle,  q(<div class="section">));
    push(@middle,  q(  <p>));
    if ($minimyth->var_get('MM_SECURITY_ENABLED') eq 'yes')
    {
        push(@middle,  q(    Your system has security enabled.));
        push(@middle,  q(    Therefore, you cannot access your system maintenance functions.));
    }
    else
    {
        push(@middle, qq(    <LI>Process related commands</LI>));
        foreach my $element (@process_manage_commands)
        {
            push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(    <LI>Device related commands</LI>));
        foreach my $element (@device_manage_commands)
        {
            push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(    <LI>Misc commands</LI>));
        foreach my $element (@misc_manage_commands)
        {
            push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(    <LI>Hardware related commands</LI>));
        foreach my $element (@hw_related_commands)
        {
            push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(    <LI>Optical Disc related commands</LI>));
        foreach my $element (@optical_disk_manage_commands)
        {
        push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(    <LI>Bluetooth related commands</LI>));
        foreach my $element (@bt_manage_commands)
        {
            push(@middle, qq(    <INPUT TYPE=button WIDTH="150" STYLE="WIDTH: 250px" onClick="parent.location='./maintenance.cgi?command=mm_manage&arg=@$element[0]'" VALUE='@$element[1]'> ));
        }
        push(@middle, qq(    <LI></LI>));

        push(@middle, qq(
          <BR>Examplary URLs for accessing Logs:<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=mythfrontend.log">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=show-log&arg=mythfrontend.log</a>
            </LI>
          </UL>
          <BR>Examplary URLs for managing this device<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=install_updates">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=mm_manage&arg=install_updates</a>
            </LI>
          </UL>
          <BR>Examplary URLs for executing binary or script<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_off">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=mm_external%20tv_power_off</a>
            </LI>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=ps%20aux">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=execute&arg=ps%20aux</a>
            </LI>
          </UL>
          <BR>Examplary URLs for launching in background binary or script<BR>
          <UL>
            <LI><a href="http://$my_ip_address/cgi-bin/maintenance.cgi?command=launch&arg=mm_do_online_update%20doupdate">
                         http://$my_ip_address/cgi-bin/maintenance.cgi?command=launch&arg=mm_do_online_update%20doupdate</a>
            </LI>
          </UL>
        ));
    }

    push(@middle,  q(  </p>));
    push(@middle,  q(</div>));

    my $page = mm_webpage->page($minimyth, { 'title' => 'Basic Maintenance', 'middle' => \@middle });

    print $_ . "\n" foreach (@{$page});
    }
}
