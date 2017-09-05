#!/usr/bin/perl
#
# <a href="proc_list.pl">Show Running Process List</a>
#
use Shell;
use strict;
use warnings;

#sub list_all_proceses {
    my $command = "/bin/ps -A --no-headers -o pid,%cpu,%mem,rss,args --sort -%cpu 2>&1 2>/dev/null |";
    my $proc_list = '';
    my $rc = open(SHELL, $command);
    while (<SHELL>) {
        $_ =~ /\s*([0-9]*)\s*([0-9.]*)\s*([0-9.]*)\s*([0-9]*)\s*(.*)/;
        if ($5 =~ m/^\[.*/) {
            next;
        }
        else {
#        $proc_list=$proc_list.'<tr><td><form name="input" action="be-maintenance.pl" method="get">
#                        <input type="hidden" id="action" name="action" value="kill" />
#                        <input type="hidden" id="daemon" name="daemon" value='.$1.' />
#                        <input type="submit" value="Kill" />
#                        </form></td>';
        $proc_list=$proc_list."<td>$2</td><td>$3</td><td>$4</td><td>$1</td><td>$5</td></tr>\n";
        }
    }
    close(SHELL);
    print       <<EOT1;

    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
    <html>
      <Title> Running Process List </Title>
        <TABLE CELLPADDING=0 >
          <TR>
            <TD>
                <form method="LINK" action="proc_list.cgi">
                    <input type="submit" value="     Refresh    ">
                </form>
            </TD>
            <TD>
                <form method="LINK" action="../index.html">
                    <input type="submit" value="     Return      ">
                </form>
            </TD>
          </TR>
        </TABLE>
      <hr>
      <h3> Running Process List </h3>
      <table border="2" cellpadding="4" cellspacing="0"  BORDERCOLOR="#dddddd">
        <tr><th>CPU</th><th>MEM</th><th>RSS</th><th>PID</th><th>Command</th></tr>
        $proc_list
      </table>
    </html>
EOT1

#}
