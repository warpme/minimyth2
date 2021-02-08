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
    push(@middle,  q(    Therefore, you cannot access your system logs.));
}
else
{
    my $command = "/bin/ps -A --no-headers -o pid,%cpu,%mem,rss,args --sort -%cpu 2>&1 2>/dev/null |";
    my $proc_list = '';
    my $rc = open(SHELL, $command);
    while (<SHELL>) {
        $_ =~ /\s*([0-9]*)\s*([0-9.]*)\s*([0-9.]*)\s*([0-9]*)\s*(.*)/;
        if ($5 =~ m/^\[.*/) {
            next;
        }
        else {
        $proc_list=$proc_list."        <tr><td>$2</td><td>$3</td><td>$4</td><td>$1</td><td>$5</td></tr>\n";
        }
    }

    push(@middle,  q(   <table border="2" cellpadding="4" cellspacing="0"  BORDERCOLOR="#dddddd">));
    push(@middle,  q(     <tr><th>CPU (%)</th><th>MEM (%)</th><th>RSS (kB)</th><th>PID</th><th>Command</th></tr>));
    push(@middle,  qq($proc_list));
    push(@middle,  q(   </table>));

}
push(@middle,  q(  </p>));
push(@middle,  q(</div>));

my $page = mm_webpage->page($minimyth, { 'title' => 'Running Process List', 'middle' => \@middle });

print $_ . "\n" foreach (@{$page});

1;
