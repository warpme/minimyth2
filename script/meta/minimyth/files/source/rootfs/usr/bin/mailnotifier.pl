#!/usr/bin/perl -w
#
# mailnotifier.pl - Declan Higgins, Piotr Oniszczuk
#
# Version 3.0 Sep 2013
#
# Scrip for every check_period checks for new mails 
# and if new are detected
# script sends notification to ip_list.
#
# Script should be called with parameter <check_period>
#
# Format of mailnotifier.rc file:
#
#    account,popserver,mbox1,password,limit,ip_list
#    account,popserver,mbox2,password,limit,ip_list
#    account,popserver,mbox3,password,limit,ip_list
#
# Legend:
# -"account" is a literal - dont edit it ...
# -"popserver" is pop server host name
# -"mbox[x]" is mailbox <UserID>
# -"password" is mailbox <password>
# -"limit" numeric field is limit the
#  number of emails notified (useful if
#  your mailbox has 500 emails). Not implemented due
#  limitation of current MythUiNotify
# -"ip_list" is list of notiefied FE IP addreses separated by ";"
#  i.e. 192.168.1.1;192.168.1.2
# Example:
#  account,pop3.o2.pl,johndoe,hispassword,5,127.0.0.1;192.168.1.1


use IO::Socket;
use Net::POP3;
use Net::Telnet;


######################################################################
#########   User Defined Variables                           #########
######################################################################

# Location of .rc file
my $config="/etc/mailnotifier.rc";

# Want to debug ?
my $debug=0;
my $debug2=0;

# Amount of sec for checking myth location and pooling POP accounts
my $check_period = $ARGV[0];

# How long osd dialog is displayed (if FE in in playback) 
my $osd_timeout=8;

# UI definition
my $new_mail_icon = "images/mythnotify/newmail.png";

our $new_mail_str;
our $accout_str;
our $mails_str;
#my $new_mail_str = "New E-Mail...";
#my $accout_str = "Account: ";
#my $mails_str = " new messages...";
require '/etc/mm_ui_localizations_perl';

# Whre sent notify
my $ip_list = "127.0.0.1";

######################################################################
#########   End User Defined Variables--Modify nothing below #########
######################################################################


my($ver)='3.0';
#my $pmc{}=-1;
my $mc=-1;
my $nmc= -1;
my $fake_out = 0;
my @notify_list = ();
my $new_mail = 0;

print "\n\n#############################\n";
print "Mail Notifier v. $ver\n";
print "Developed by: Declan Higgins\n";
print "Extended  by: Piotr Oniszczuk\n";
print "#############################\n\n";



sub stack_notify {
    my ($title,$origin,$description,$extra,$image,$progress_text,$progress,$timeout,$style,$ip_list) = @_;
    my @dest_list = ();
    my $msg = "";
    @dest_list = split(/;/, $ip_list);
    print ("OSD_notify:\n  title=\"$title\"\n  origin=\"$origin\"\n  description=\"$description\"\n  extra=\"$extra\"\n  image=\"$image\"\n  progress_txt=\"$progress_text\"\n  progress=$progress\n  style=\"$style\"\n") if ($debug);

    for (@dest_list) {
        print ("OSD_notify: notify OSD at IP=$_ \n") if ($debug2);
        $msg ="<mythnotification version=\"1\">
            <image>$image</image>
            <text>$title</text>
            <origin>$origin</origin>
            <description>$description</description>
            <extra>$extra</extra>
            <progress_text>$progress_text</progress_text>
            <progress>$progress</progress>
            <timeout>$timeout</timeout>";
        if ($style) { $msg = $msg."
            <type>$style</type>" } $msg = $msg."
        </mythnotification>";

        @notify_list = (@notify_list,$msg);

    }
}

sub do_account  () {
    my $unwanted = shift ;
    my $mail_server = shift ;
    my $username = shift ;
    my $password = shift ;
    my $maxmess = shift ;
    my $dest_ip = shift ;
    my $messno = 0;
    my $pmc;

    print("  Mail Srv is: $mail_server\n") if ($debug);
    print("  Username is: $username\n") if ($debug);
    print("  Password is: $password\n") if ($debug);

    $pop = Net::POP3->new($mail_server)
        or return $nmc;

    defined ($pop->login($username, $password))
        or return $nmc;

    $messages = $pop->list
        or return $nmc;

    $mc = keys %$messages;
    print("  Msg in $username: $mc\n") if ($debug);
    if ($pmc{$username} == $mc) {
        $pmc{$username} = $mc;
        print("  No new or deleted mails\n ") if ($debug);
        return $nmc;
    }

    print("  New or deleted mails detected. Was:$pmc{$username}, now is:$mc") if ($debug);
    $pmc{$username} = $mc;
    if ($mc==0) {
        return $nmc;
    }

    $nmc="[$username\@$mail_server]: $mc nowych wiad.";
    $new_mail = 1;

    stack_notify(
    #        title
    #        origin
    #        description
    #        extra
    #        image
    #        progress_text
    #        progress
    #        timeout
    #        style
    #        ip_list
    $new_mail_str,
    "", 
    $accout_str.$username."@".$mail_server,
    $mc.$mails_str,
    $new_mail_icon,
    "",
    "",
    $osd_timeout,
    "",
    $ip_list
    );

    return $nmc;
}

sleep (120);

while (1) {

    open CONFIG,"<$config";

    while (<CONFIG>) {
        print("\nChecking account\n") if ($debug);
        chomp;
        @b=split /,/;
        next unless $b[0] eq "account";
            my $msg = &do_account (@b);
    }

    if ($new_mail) {
        my $item;
        my @dest_list = ();
        @dest_list = split(/,/, $ip_list);

        for (@dest_list) {
            foreach $item (@notify_list) {
                my $mythnotify_fh = IO::Socket::INET->new(PeerAddr=>$_,Proto=>'udp',PeerPort=>6948);
                if ($mythnotify_fh) {
                    print $mythnotify_fh $item;
                    $mythnotify_fh->close;
                    print ("Notify via OSD to IP=$_ done\n") if ($debug);
                }
            }
        }

        $new_mail = 0;
        @notify_list = ();
    }

    print("Sleeping $check_period sec.\n") if ($debug);

    sleep ($check_period);

}
1
