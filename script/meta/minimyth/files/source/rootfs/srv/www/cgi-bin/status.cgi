#!/usr/bin/perl

use warnings;
use strict;

use File::Spec ();
use MiniMyth ();

require "/srv/www/cgi-bin/mm_webpage.pm";

my $minimyth   = new MiniMyth;
my $mm_version = $minimyth->var_get('MM_VERSION');
my $devnull    = File::Spec->devnull;



my @status_sensors_body = ();
my $status_sensors_head = q(Sensors (output of command "sensors"));
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

my $status_cpu_temp_head = "";
my @status_cpu_temp_body = ();
my @cpu_temp = `find /sys/class/thermal/thermal_zone*/temp -type f`;
if (@cpu_temp)
{
    $status_cpu_temp_head = "CPU Current Temperature";
    @status_cpu_temp_body = ();

    foreach my $cpu_temp (@cpu_temp) {

        if (open(FILE, "cat $cpu_temp |"))
        {
            while (<FILE>)
            {
                chomp;
                $cpu_temp =~ s/\/sys\/class\/thermal\///g;
                $cpu_temp =~ s/\/temp//g;
                chomp $cpu_temp;
                if ($_ > 0) {
                    my $temp = $_/1000;
                    push(@status_cpu_temp_body, "$cpu_temp: ".$temp." C");
                }
            }
            close(FILE);
        }
    }
    while (($#status_cpu_temp_body >= 0) && ($status_cpu_temp_body[0] eq ''))
    {
        shift(@status_cpu_temp_body);
    }
    while (($#status_cpu_temp_body >= 0) && ($status_cpu_temp_body[$#status_cpu_temp_body] eq ''))
    {
        pop(@status_cpu_temp_body);
    }
}

my $status_cpu_curr_freq_head = "";
my @status_cpu_curr_freq_body = ();
my @cpu_curr_freq = `find /sys/devices/system/cpu/cpu* -name scaling_cur_freq`;
if (@cpu_curr_freq)
{
    $status_cpu_curr_freq_head = "CPU Current Frequency";
    @status_cpu_curr_freq_body = ();

    foreach my $cpu_curr_freq (@cpu_curr_freq) {

        if (open(FILE, "cat $cpu_curr_freq |"))
        {
            while (<FILE>)
            {
                chomp;
                $cpu_curr_freq =~ s/\/sys\/devices\/system\/cpu\/cpufreq\/policy(.*)\/scaling_cur_freq/CPU$1/g;
                chomp $cpu_curr_freq;
                if ($_ > 0) {
                    my $freq = $_/1000;
                    push(@status_cpu_curr_freq_body, $cpu_curr_freq.": ".$freq." MHz");
                }
            }
            close(FILE);
        }
    }
    while (($#status_cpu_curr_freq_body >= 0) && ($status_cpu_curr_freq_body[0] eq ''))
    {
        shift(@status_cpu_curr_freq_body);
    }
    while (($#status_cpu_curr_freq_body >= 0) && ($status_cpu_curr_freq_body[$#status_cpu_curr_freq_body] eq ''))
    {
        pop(@status_cpu_curr_freq_body);
    }
}

my $status_gpu_curr_freq_head = "";
my @status_gpu_curr_freq_body = ();
my @gpu_curr_freq = `find /sys/bus/platform/drivers/*/*.gpu/devfreq -name cur_freq`;
if (@gpu_curr_freq)
{
    $status_gpu_curr_freq_head = "GPU Current Frequency";
    @status_gpu_curr_freq_body = ();

    foreach my $gpu_curr_freq (@gpu_curr_freq) {

        if (open(FILE, "cat $gpu_curr_freq |"))
        {
            while (<FILE>)
            {
                chomp;
                $gpu_curr_freq =~ s/\/sys\/bus\/platform\/drivers\/.*\/.*\/cur_freq/GPU: /g;
                chomp $gpu_curr_freq;
                if ($_ > 0) {
                    my $freq = $_/1000000;
                    push(@status_gpu_curr_freq_body, $gpu_curr_freq.$freq." MHz");
                }
            }
            close(FILE);
        }
    }
    while (($#status_gpu_curr_freq_body >= 0) && ($status_gpu_curr_freq_body[0] eq ''))
    {
        shift(@status_gpu_curr_freq_body);
    }
    while (($#status_gpu_curr_freq_body >= 0) && ($status_gpu_curr_freq_body[$#status_gpu_curr_freq_body] eq ''))
    {
        pop(@status_gpu_curr_freq_body);
    }
}

my $status_cpu_freq_head = "";
my @status_cpu_freq_body = ();
my @cpus_stats = `find /sys/devices/system/cpu/cpufreq/policy*/stats -name trans_table`;
if (@cpus_stats)
{
    $status_cpu_freq_head = "CPU DVFS Frequency List";
    @status_cpu_freq_body = ();

    foreach my $cpu_stats (@cpus_stats) {

        if (open(FILE, "cat $cpu_stats |"))
        {
            my $cpu_num = "unknown";
            ($cpu_num) = $cpu_stats =~ /(\d+)/;
            push(@status_cpu_freq_body, "CPU".$cpu_num.":");
                while (<FILE>)
                {
                    chomp;
                    push(@status_cpu_freq_body, $_);
                }
                close(FILE);
            }
        push(@status_cpu_freq_body, " ");
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
    $status_gpu_freq_head = "GPU DVFS Freqency List";
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

if (@status_sensors_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_sensors_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_sensors_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}
if (@status_cpu_temp_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_cpu_temp_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_cpu_temp_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}
if (@status_cpu_curr_freq_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_cpu_curr_freq_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_cpu_curr_freq_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}
if (@status_gpu_curr_freq_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_gpu_curr_freq_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_gpu_curr_freq_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}
if (@status_cpu_freq_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_cpu_freq_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_cpu_freq_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}
if (@status_gpu_freq_body) {
    push(@middle,  q(<div class="section">));
    push(@middle, qq(  <div class="heading">$status_gpu_freq_head</div>));
    push(@middle,  q(  <div class="status">));
    push(@middle, @status_gpu_freq_body);
    push(@middle,  q(  </div>));
    push(@middle,  q(</div>));
}

my $page = mm_webpage->page($minimyth, { 'title' => 'Status', 'middle' => \@middle , 'style' => [ '../css/status.css' ] });

print $_ . "\n" foreach (@{$page});

1;
