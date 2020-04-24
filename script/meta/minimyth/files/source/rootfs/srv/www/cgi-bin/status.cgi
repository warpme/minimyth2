#!/usr/bin/perl

use warnings;
use strict;

use File::Spec ();
use MiniMyth ();

require "/srv/www/cgi-bin/mm_webpage.pm";

my $minimyth   = new MiniMyth;
my $mm_version = $minimyth->var_get('MM_VERSION');
my $devnull    = File::Spec->devnull;

my $status_sensors_head = q(Sensors (output of command "sensors"));
my @status_sensors_body = ();
if (system(qq(/usr/bin/sensors > $devnull 2>&1)) == 0)
{
    if (open(FILE, '-|', '/usr/bin/sensors'))
    {
        while (<FILE>)
        {
            chomp;
            if (/(: *)([-+][0-9]+\.[0-9]+)( C)/)
            {
                my $class;
                if    ($2 < 50) { $class = 'temp_cool'; }
                elsif ($2 < 70) { $class = 'temp_warm'; }
                else            { $class = 'temp_hot';  }

                s/(: *)([-+][0-9]+\.[0-9]+)( C)/$1<span class="$class">$2$3<\/span>/;
            }
            push(@status_sensors_body, $_);
        }
        close(FILE);
    }
}
while (($#status_sensors_body >= 0) && ($status_sensors_body[0] eq ''))
{
    shift(@status_sensors_body);
}
while (($#status_sensors_body >= 0) && ($status_sensors_body[$#status_sensors_body] eq ''))
{
    pop(@status_sensors_body);
}


my $status_cpu_freq_head = "";
my @status_cpu_freq_body = ();

my $cpu_freq = `find /sys/devices/system/cpu/cpufreq/policy*/stats -name trans_table`;
#my $cpu_freq = `find /sys/devices/system/cpu/cpufreq/policy*/stats -name time_in_state`;
if ($cpu_freq)
{
    $status_cpu_freq_head = "CPU DVFS Freqs (output of ".$cpu_freq.")";
    @status_cpu_freq_body = ();

    if (open(FILE, "cat $cpu_freq |"))
    {
        while (<FILE>)
        {
            chomp;
            push(@status_cpu_freq_body, $_);
        }
        close(FILE);
    }

    while (($#status_cpu_freq_body >= 0) && ($status_cpu_freq_body[0] eq ''))
    {
        shift(@status_cpu_freq_body);
    }
    while (($#status_cpu_freq_body >= 0) && ($status_cpu_freq_body[$#status_cpu_freq_body] eq ''))
    {
        pop(@status_cpu_freq_body);
    }
}

my $status_gpu_freq_head = "";
my @status_gpu_freq_body = ();

my $gpu_freq = `find /sys/bus/platform/drivers/*/*.gpu/devfreq -name trans_stat`;
if ($gpu_freq)
{
    $status_gpu_freq_head = "GPU DVFS Freqs (output of ".$gpu_freq.")";
    @status_gpu_freq_body = ();

    if (open(FILE, "cat $gpu_freq |"))
    {
        while (<FILE>)
        {
            chomp;
            push(@status_gpu_freq_body, $_);
        }
        close(FILE);
    }

    while (($#status_gpu_freq_body >= 0) && ($status_gpu_freq_body[0] eq ''))
    {
        shift(@status_gpu_freq_body);
    }
    while (($#status_gpu_freq_body >= 0) && ($status_gpu_freq_body[$#status_gpu_freq_body] eq ''))
    {
        pop(@status_gpu_freq_body);
    }
}


my @middle = ();

push(@middle,  q(<div class="section">));
push(@middle, qq(  <div class="heading">$status_sensors_head</div>));
push(@middle,  q(  <div class="status">));
push(@middle, @status_sensors_body);
push(@middle,  q(  </div>));
push(@middle,  q(</div>));
push(@middle,  q(<div class="section">));
push(@middle, qq(  <div class="heading">$status_cpu_freq_head</div>));
push(@middle,  q(  <div class="status">));
if (@status_cpu_freq_body) {push(@middle, @status_cpu_freq_body)};
push(@middle,  q(  </div>));
push(@middle, qq(  <div class="heading">$status_gpu_freq_head</div>));
push(@middle,  q(  <div class="status">));
if (@status_gpu_freq_body) {push(@middle, @status_gpu_freq_body)};
push(@middle,  q(  </div>));
push(@middle,  q(</div>));

my $page = mm_webpage->page($minimyth, { 'title' => 'Status', 'middle' => \@middle , 'style' => [ '../css/status.css' ] });

print $_ . "\n" foreach (@{$page});

1;
