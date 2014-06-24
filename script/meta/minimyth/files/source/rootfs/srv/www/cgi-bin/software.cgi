#!/usr/bin/perl

use warnings;
use strict;

use MiniMyth ();

require "/srv/www/cgi-bin/mm_webpage.pm";

my $minimyth   = new MiniMyth;
my $mm_version = $minimyth->var_get('MM_VERSION');

my @middle = ();

push(@middle,  q(<div class="section">));
push(@middle,  q(  <div class="heading">Versions and Licenses</div>));
push(@middle,  q(  <p>));
push(@middle,  q(    This is a list of all the software built as part of the Myth@Home build process.));
push(@middle,  q(    Depending on the Myth@Home build system configuration options,));
push(@middle,  q(    some of the software may not have been included in the Myth@Home binary image.));
push(@middle,  q(  </p>));
push(@middle,  q(  <ul>));
push(@middle,  q(    <li>));
push(@middle,  q(      Myth@Home:));
push(@middle,  q(      <ul>));
push(@middle,  q(        <li>));
push(@middle,  q(          <strong>Myth@Home</strong>));
push(@middle, qq(          $mm_version));
push(@middle,  q(          ;));
push(@middle,  q(          <a href="../license.txt" type="text/plain">license</a>));
push(@middle,  q(          <ul>));
if (-f "/srv/www/software/gar-minimyth-$mm_version.tar.bz2")
{
    push(@middle, qq(            <li><a href="../software/gar-minimyth-$mm_version.tar.bz2" type="application/x-bzip2">build system source (gar-minimyth-$mm_version.tar.bz2)</a></li>));
}
if (-f "/srv/www/software/base/versions/minimyth.conf.mk")
{
    push(@middle,  q(            <li><a href="../software/base/versions/minimyth.conf.mk" type="text/plain">build system configuration (minimyth.conf.mk)</a></li>));
}
push(@middle,  q(          </ul>));
push(@middle,  q(        </li>));
push(@middle,  q(      </ul>));
push(@middle,  q(    </li>));

my @type_name   = ( 'base',
                    'extras',
                    'build' );
my %type_header = ( 'base'   => q(base ('/' and '/usr'):),
                    'extras' => q(extras ('/usr/local'):),
                    'build'  => q(build (natively compiled software used for cross compiling and assembling Myth@Home):));

foreach my $type (@type_name)
{
    push(@middle,  q(    <li>));
    push(@middle, qq(      $type_header{$type}));
    if (-d "/srv/www/software/$type/versions")
    {
        push(@middle,  q(      <ul>));
        if (opendir(SOFTWAREDIR, "/srv/www/software/$type/versions"))
        {
            foreach my $software (grep((! /^\./) && (! /^minimyth$/) && (! /^minimyth.conf.mk$/), (readdir(SOFTWAREDIR))))
            {
                my $version = '';
                if (open(FILE, '<', "/srv/www/software/$type/versions/$software"))
                {
                    while(<FILE>)
                    {
                        chomp;
                        $version = $_;
                        last;
                    }
                    close(FILE);
                }
                if ($version eq 'none')
                {
                    $version = '';
                }
                my @license_list = ();
                if ((-d "/srv/www/software/$type/licenses/$software") && \
                    (opendir(LICENSEDIR, "/srv/www/software/$type/licenses/$software")))
                {
                    foreach (grep(! /^\./, (readdir(LICENSEDIR))))
                    {
                        chomp;
                        push(@license_list, $_);
                    }
                    closedir(LICENSEDIR);
                }
                push(@middle,  q(        <li>));
                push(@middle, qq(          <strong>$software</strong>));
                push(@middle, qq(          $version));
                push(@middle,  q(          ;));
                foreach my $license (@license_list)
                {
                    push(@middle, qq(          <a href="../software/$type/licenses/$software/$license" type="text/plain">license</a>));
                }
                push(@middle,  q(        </li>));
            }
            closedir(SOFTWAREDIR);
        }
        push(@middle,  q(      </ul>));
    }
    push(@middle,  q(    </li>));
}
push(@middle,  q(  </ul>));
push(@middle,  q(</div>));

my $page = mm_webpage->page($minimyth, { 'title' => 'Software', 'middle' => \@middle });

print $_ . "\n" foreach (@{$page});

1;
