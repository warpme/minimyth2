package mm_webpage;

use warnings;
use strict;

use Date::Manip ();
use MiniMyth ();

sub page
{
    my $self     = shift;
    my $minimyth = shift;
    my $args     = shift;

    my $style    = undef;
    my $title    = undef;
    my $middle   = undef;

    if (defined($args))
    {
        if (exists($args->{'style'}))
        {
            $style = $args->{'style'};
        }
        if (exists($args->{'title'}))
        {
            $title = $args->{'title'};
        }
        if (exists($args->{'middle'}))
        {
            $middle = $args->{'middle'};
        }
    }

    my $page_host  = $minimyth->hostname();
    my $page_date  = Date::Manip::UnixDate('now', '%Y-%m-%d %H:%M:%S %Z');

    my @page = ();

    push(@page,  q(Content-Type: text/html; charset=UTF-8));
    push(@page,  q());
    push(@page,  q(<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">));
    push(@page,  q(<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">));
    push(@page,  q(  <head>));
    push(@page,  q(    <meta name="author" content="Paul Bender" />));
    push(@page,  q(    <meta name="copyright" content="2006-2009 Paul Bender &amp; minimyth.org" />));
    push(@page,  q(    <meta name="keywords" content="PVR,Linux,MythTV,MiniMyth" />));
    push(@page,  q(    <meta name="description" content="" />));
    push(@page,  q(    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />));
    push(@page, qq(    <title>$title</title>));
    push(@page,  q(    <style type="text/css" title="main-styles">));
    push(@page,  q(      @import "../css/minimyth.css";));
    if (defined($style))
    {
        foreach (@{$style})
        {
             push(@page,  q(      @import ) . qq("$_";));
        }
    }
    push(@page,  q(    </style>));
    push(@page,  q(  </head>));
    push(@page,  q(  <body>));
    push(@page,  q(    <div class="main">));
    push(@page,  q(      <div class="header">));
    push(@page,  q(        <div class="heading">MiniMyth2</div>));
    push(@page,  q(        <div class="menu">));
    push(@page,  q(          <span class="menuItemFirst"><a href="../index.html">Home</a></span>));
    push(@page, qq(          <span class="menuItem"     >$title</span>));
    push(@page,  q(        </div>));
    push(@page,  q(        <div class="note">));
    push(@page, qq(          $page_date<br />));
    push(@page, qq(          $page_host));
    push(@page,  q(        </div>));
    push(@page,  q(      </div>));
    push(@page,  q(      <div class="middle">));
    push(@page, qq(      <div class="heading">System $title</div>));
    push(@page, @{$middle});
    push(@page,  q(      </div>));
    push(@page,  q(      <div class="footer">));
    push(@page,  q(        <hr />));
    push(@page,  q(        <div class="valid-xhtml">));
    push(@page,  q(          <a href="http://validator.w3.org/check?uri=referer"><img));
    push(@page,  q(              src="/image/w3c-valid-xhtml11-blue.gif"));
    push(@page,  q(              alt="Valid XHTML 1.1" height="31" width="88" /></a>));
    push(@page,  q(        </div>));
    push(@page,  q(        <div class="valid-css">));
    push(@page,  q(          <a href="http://jigsaw.w3.org/css-validator/check/referer"><img));
    push(@page,  q(              src="/image/w3c-valid-css2-blue.gif"));
    push(@page,  q(              alt="Valid CSS!"      height="31" width="88" /></a>));
    push(@page,  q(        </div>));
    push(@page,  q(        <div class="version">));
    push(@page,  q(          Last Updated on 2020-01-06));
    push(@page,  q(          <br />));
    push(@page,  q(          &lt;&nbsp;mailto&nbsp;:&nbsp;piotr.oniszczuk&nbsp;at&nbsp;gmail&nbsp;dot&nbsp;com&nbsp;&gt;));
    push(@page,  q(        </div>));
    push(@page,  q(      </div>));
    push(@page,  q(    </div>));
    push(@page,  q(  </body>));
    push(@page,  q(</html>));

    return \@page;
}

1;
