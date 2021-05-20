package MiniMyth;

use strict;
use warnings;
use feature "switch";

use DBD::mysql ();
use DBI ();
use File::Basename ();
use File::Copy ();
use File::Find ();
use File::Path ();
use File::Spec ();
use Net::Telnet ();
use WWW::Curl::Easy qw(CURLINFO_HTTP_CODE CURLOPT_FOLLOWLOCATION CURLOPT_HTTPHEADER CURLOPT_INFILE CURLOPT_INFILESIZE CURLOPT_UPLOAD CURLOPT_URL CURLOPT_VERBOSE CURLOPT_WRITEDATA);

no warnings 'deprecated';
no warnings 'experimental';

sub new
{
    my $proto = shift;

    my $class = ref($proto) || $proto;

    my $self;
    $self->{'conf_variable'} = undef;
    $self->{'mythdb_handle'} = undef;

    bless($self, $class);

    return $self;
}

sub DESTROY
{
    my $self = shift;

    if (defined $self->{'mythdb_handle'})
    {
        $self->{'mythdb_handle'}->disconnect;
    }
}

#===============================================================================
# general functions.
#===============================================================================
sub application_path
{
    my $self        = shift;
    my $application = shift;

    my $path = '';
    if (open(FILE, '-|', "/usr/bin/which $application"))
    {
        while (<FILE>)
        {
            chomp;
            $path = $_;
            last;
        }
        close(FILE);
    }

    return $path;
}

sub application_pids
{
    my $self        = shift;
    my $application = shift;

    my @pids = ();
    if (open(FILE, '-|', "/bin/pidof $application"))
    {
        while (<FILE>)
        {
            chomp;
            push(@pids, split(/ +/, $_));
        }
        close(FILE);
    }

    return \@pids;
}

sub application_cmds
{
    my $self        = shift;
    my $application = shift;

    my $pids = join(',', @{$self->application_pids($application)});

    my @cmds = ();

    if ($pids)
    {
        if (open(FILE, '-|', "/bin/ps h -p $pids -o cmd"))
        {
            while(<FILE>)
            {
                chomp;
                push(@cmds, $_);
            }
            close(FILE);
        }
    }

    return \@cmds;
}

sub application_running
{
    my $self        = shift;
    my $application = shift;

    my @pids = @{$self->application_pids($application)};

    my $running = 0;
    if (@pids)
    {
        $running = 1;
    }

    return $running;
}

sub application_stop
{
    my $self        = shift;
    my $application = shift;
    my $message     = shift;

    my @pids = @{$self->application_pids($application)};

    if ((defined($message)) && ($message) && (@pids))
    {
        $self->message_output('info', $message);
    }
  
    foreach (@pids)
    {
        system(qq(/bin/kill $_));
    }

    return 1;
}

sub hostname
{
    my $self = shift;

    my $hostname = `/bin/hostname`;

    chomp $hostname;

    if ($hostname eq '?')
    {
        $hostname = '';
    }

    return $hostname;
}

#===============================================================================
# Message output functions.
#===============================================================================
sub message_output
{
    my $self    = shift;
    my $level   = shift;
    my $message = shift;

    if ($self->splash_running_test)
    {
        system(qq(/usr/bin/logger    -t minimyth -p local0.$level "$message"));

        if    ($level eq 'err')
        { 
            $self->splash_message_output(qq(error: $message));
            $self->splash_command(qq(log $message));
        }
        elsif ($level eq 'warn')
        {
            $self->splash_message_output(qq(warning: $message));
            $self->splash_command(qq(log $message));
        }
        else
        {
            $self->splash_message_output(qq($message));
        }
    }
    else
    {
        system(qq(/usr/bin/logger -s -t minimyth -p local0.$level "$message"));
    }
}

sub message_log
{
    my $self    = shift;
    my $level   = shift;
    my $message = shift;

    system(qq(/usr/bin/logger -t minimyth -p local0.$level "$message"));
}

#===============================================================================
# MiniMyth configuration variable functions.
#===============================================================================
sub var_clear
{
    my $self = shift;

    if (defined $self->{'conf_variable'})
    {
        undef $self->{'conf_variable'};
    }
}

sub var_load
{
    my $self = shift;
    my $args = shift;

    my $conf_file   = ($args && $args->{'file'}  ) || '';
    my $conf_filter = ($args && $args->{'filter'}) || 'MM_.*';

    my %conf_variable;

    if ((exists($self->{'conf_variable'})) && (defined($self->{'conf_variable'})))
    {
        foreach (keys %{$self->{'conf_variable'}})
        {
            $conf_variable{$_} = $self->{'conf_variable'}->{$_};
        }
    }

    my $shell_command = ". /etc/conf";
    $shell_command = $shell_command . " ; . /lib/minimyth/functions";
    if ($conf_file)
    {
        if (-r $conf_file)
        {
            $shell_command = $shell_command . " ; . $conf_file";
        }
        else
        {
            $self->message_log('warn', "MiniMyth::var_load: file '$conf_file' does not exist.");
        }
    }
    $shell_command = $shell_command . " ; set";

    if ((-x '/bin/sh') && (open(FILE, '-|', qq(/bin/sh -c '$shell_command'))))
    {
        my $name  = '';
        my $value = '';
        while (<FILE>)
        {
            chomp;
            if (! $name)
            {
                if (/^([^=]+)=('.*)$/)
                {
                    $name  = $1;
                    $value = $2
                }
            }
            else
            {
                $value = $value . ' ' . $_;
            }
            if (($name) && ($value =~ /^'(.*)'$/))
            {
                $value = $1;
                if ($name =~ /^$conf_filter$/)
                {
                    $conf_variable{$name} = $value;
                }
                $name  = '';
                $value = '';
            }
        }
        close(FILE);
    }

    $self->{'conf_variable'} = \%conf_variable;
}

sub var_save
{
    my $self = shift;
    my $args = shift;

    my $conf_file   = ($args && $args->{'file'}  ) || '/etc/conf.d/minimyth';
    my $conf_filter = ($args && $args->{'filter'}) || 'MM_.*';

    # If the variables have not been loaded and the processed variables file exists, then autoload variables.
    (! defined $self->{'conf_variable'}) && (-e '/etc/conf.d/minimyth') && $self->var_load();

    (defined $self->{'conf_variable'}) || die 'MiniMyth::var_save: MiniMyth configuration variables have not been loaded.';

    File::Path::mkpath(File::Basename::dirname("$conf_file"), { mode => 0755 });
    unlink("$conf_file.$$");
    if (open(FILE, '>', "$conf_file.$$"))
    {
        chmod(00644, "$conf_file.$$");
        foreach (sort keys %{$self->{'conf_variable'}})
        {
            chomp;
            if (/^$conf_filter$/)
            {
                print FILE $_ . "=" . "'" . $self->{'conf_variable'}->{$_} . "'" . "\n";
            }
        }
        close(FILE);
        unlink("$conf_file");
	rename("$conf_file.$$", "$conf_file");
    }
}

sub var_list
{
    my $self = shift;
    my $args = shift;

    # If the variables have not been loaded and the processed variables file exists, then autoload variables.
    (! defined $self->{'conf_variable'}) && (-e '/etc/conf.d/minimyth') && $self->var_load();

    (defined $self->{'conf_variable'}) || die 'MiniMyth::var_list: MiniMyth configuration variables have not been loaded.';

    my $conf_filter = ($args && $args->{'filter'}) || 'MM_.*';

    my @list = sort(grep(/^$conf_filter$/, (keys %{$self->{'conf_variable'}})));

    return \@list;
}


sub var_get
{
    my $self  = shift;
    my $name  = shift;

    # If the variables have not been loaded and the processed variables file exists, then autoload variables.
    (! defined $self->{'conf_variable'}) && (-e '/etc/conf.d/minimyth') && $self->var_load();

    (defined $self->{'conf_variable'}) || die 'MiniMyth::var_get: MiniMyth configuration variables have not been loaded.';

    return $self->{'conf_variable'}->{$name};
}

sub var_set
{
    my $self  = shift;
    my $name  = shift;
    my $value = shift;

    # If the variables have not been loaded and the processed variables file exists, then autoload variables.
    (! defined $self->{'conf_variable'}) && (-e '/etc/conf.d/minimyth') && $self->var_load();

    (defined $self->{'conf_variable'}) || die 'MiniMyth::var_set: MiniMyth configuration variables have not been loaded.';

    $self->{'conf_variable'}->{$name} = $value;
}

sub var_exists
{
    my $self  = shift;
    my $name  = shift;

    (! defined $self->{'conf_variable'}) && (-e '/etc/conf.d/minimyth') && $self->var_load();

    (defined $self->{'conf_variable'}) || die 'MiniMyth::var_exists: MiniMyth configuration variables have not been loaded.';

    if (defined $self->{'conf_variable'}->{$name})
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

#===============================================================================
# hardware autodetection functions.
#===============================================================================
sub detect_state_get
{
    my $self     = shift;
    my $group    = shift;
    my $instance = shift;
    my $field    = shift;

    my %map;
    $map{'audio'}    = [ 'card_number' , 'device_number' , 'gain' ];
    $map{'backend'}  = [ 'enabled'];
    $map{'event'}    = [ 'device' , 'type' ];
    $map{'firmware'} = [ 'file_list' ];
    $map{'lcdproc'}  = [ 'device' , 'driver'];
    $map{'lirc'}     = [ 'device' , 'driver', 'lircd_conf' ];
    $map{'video'}    = [ 'driver' ];

    my @state;

    my $state_dir = "/var/cache/minimyth/detect/$group";
    if ((-d $state_dir) && (opendir(DIR, $state_dir)))
    {
        foreach (readdir(DIR))
        {
            if ((! /^\./) && (-f "$state_dir/$_") && (open(FILE, '<', "$state_dir/$_")))
            {
                while (<FILE>)
                {
                    chomp;
                    my %record;
                    my @record_raw = split(/,/, $_);
                    for (my $index = 0 ; $index <= $#record_raw ; $index++)
                    {
                        $record{$map{$group}->[$index]} = $record_raw[$index];
                    }
                    push(@state, \%record);
                }
                close(FILE);
            }
        }
        closedir(DIR);
    }


    if    (defined $field)
    {
        if (($#state >= $instance) && ($instance >= 0) && (defined $state[$instance]) && (defined $state[$instance]->{$field}))
        {
            return $state[$instance]->{$field};
        }
        else
        {
            return undef;
        }
    }
    elsif (defined $instance)
    {
        if (($#state >= $instance) && ($instance >= 0) && (defined $state[$instance]))
        {
            return $state[$instance];
        }
        else
        {
            return undef;
        }
    }
    else
    {
        return \@state;
    }
}

#===============================================================================
# device functions.
#===============================================================================
sub device_canonicalize
{
    my $self   = shift;
    my $device = shift;

    # If possible, covert the device name to its real name.
    if (($device) && (-e $device) && (open(FILE, '-|', qq(/usr/bin/udevadm info --query=name --root --name='$device'))))
    {
        while (<FILE>)
        {
            chomp;
            $device = $_;
            last;
        }
        close(FILE);
    }
    # If possible, covert the device name to its persistent link name.
    if (($device) && (-e $device) && (open(FILE, '-|', qq(/usr/bin/udevadm info --query=symlink --root --name='$device'))))
    {
        while (<FILE>)
        {
            chomp;
            if (/^\/dev\/persistent\/.*$/)
            {
                chomp;
                $device = $_;
                last;
            }
        }
        close(FILE);
    }

    return $device;
};


#===============================================================================
# splash screen functions
#===============================================================================
my $var_splash_command      = '/usr/sbin/fbsplashd';
my $var_splash_command_dir  = File::Basename::dirname($var_splash_command);
my $var_splash_command_base = File::Basename::basename($var_splash_command);
my $var_splash_fifo         = '/lib/splash/cache/.splash';
my $var_splash_fifo_dir     = File::Basename::dirname($var_splash_fifo);
my $var_splash_fifo_base    = File::Basename::basename($var_splash_fifo);
my $var_splash_progress_val = 1;
my $var_splash_progress_max = 1;

sub splash_running_test
{
    my $self = shift;

    my $devnull = File::Spec->devnull;
    if (($self->application_running($var_splash_command_base)) && (-e $var_splash_fifo))
    {
        return 1;
    }
    else
    {
        return 0;
    }
}

sub splash_init
{
    my $self = shift;
    my $type = shift || '';

    my $enable = 'yes';

    # Disable splash screen when more than kernel critical messages are logged to the console.
    # That is when the loglevel is greater than 3.
    if ($enable eq 'yes')
    {
        if (open(FILE, '<', '/proc/sys/kernel/printk'))
        {
            my $LOGLEVEL;
            while (<FILE>)
            {
                chomp;
                ($LOGLEVEL) = split(/[[:cntrl:]]|[ ]/, $_);
            }
            close(FILE);
            ($LOGLEVEL eq '')                    && ($enable = 'no');
            ($LOGLEVEL ne '') && ($LOGLEVEL > 3) && ($enable = 'no');
        }
    }

    # Disable splash screen when there is no framebuffer device.
    if ($enable eq 'yes')
    {
        (! -e '/dev/fb0') && ($enable = 'no');
    }

    # Disable splash screen when the video resolution is not compatible.
    # That is when the resolution is not 640x480 or color depth is less than 16.
    if ($enable eq 'yes')
    {
        if (open(FILE, '-|', '/usr/sbin/fbset'))
        {
            while (<FILE>)
            {
                chomp;
                if (/geometry/)
                {
                    my (undef, $XRES, $YRES, $VXRES, $VYRES, $DEPTH) = split(/ /, $_);
                    ($XRES  eq '') &&                    ($enable = 'no');
                    ($YRES  eq '') &&                    ($enable = 'no');
                    ($VXRES eq '') &&                    ($enable = 'no');
                    ($VYRES eq '') &&                    ($enable = 'no');
                    ($DEPTH eq '') &&                    ($enable = 'no');
                    ($XRES  ne '') && ($XRES  != 640) && ($enable = 'no');
                    ($YRES  ne '') && ($YRES  != 480) && ($enable = 'no');
                    ($VXRES ne '') && ($VXRES != 640) && ($enable = 'no');
                    ($VYRES ne '') && ($VYRES != 480) && ($enable = 'no');
                    ($DEPTH ne '') && ($DEPTH <   16) && ($enable = 'no');
                }
            }
            close(FILE);
        }
        else
        {
            $enable = 'no';
        }
    }

    if ($enable eq 'yes')
    {
        my $message;
        given ($type)
        {
            when (/^bootup$/  ) { $message = 'starting system ...'     ; }
            when (/^shutdown$/) { $message = 'shutting down system ...'; }
            when (/^reboot$/  ) { $message = 'restarting system ...'   ; }
            default             { $message = ''                        ; }
        }
        $self->message_log('info', qq(starting splash screen));
        File::Path::mkpath($var_splash_fifo_dir, { mode => 0755 });
        $self->splash_command('exit');
        system(qq($var_splash_command --theme="minimyth" --progress="0" --mesg="$message" --type="$type"));
        $self->splash_command('set tty silent 3');
        $self->splash_command('set tty verbose 1');
        $self->splash_command('set mode silent');
        $self->splash_command('repaint');
    }

    $self->splash_progress_set(0, 1);

    return 1;
}

sub splash_halt
{
    my $self = shift;

    $self->message_log('info', qq(stopping splash screen));

    $self->splash_command('exit staysilent');

    return 1;
}

sub splash_command
{
    my $self    = shift;
    my $command = shift;

    if ($self->splash_running_test())
    {
        if (open(FILE, '>>', $var_splash_fifo))
        {
            print FILE $command . "\n";
            close(FILE);
        }
    }

    return 1;
}

sub splash_message_output
{
    my $self    = shift;
    my $message = shift;

    $self->splash_command(qq(set message $message));
    $self->splash_command('repaint');

    return 1;
}

sub splash_progress_set
{
    my $self         = shift;
    my $progress_val = shift;
    my $progress_max = shift;

    $var_splash_progress_val = $progress_val;
    $var_splash_progress_max = $progress_max;

    ($var_splash_progress_val > $var_splash_progress_max) && ($var_splash_progress_val = $var_splash_progress_max);

    my $progress = (65535 * $var_splash_progress_val) / $var_splash_progress_max;
    $self->splash_command(qq(progress $progress));
    $self->splash_command('repaint');

    return 1;
}

sub splash_progress_update
{
    my $self = shift;

    $var_splash_progress_val = $var_splash_progress_val + 1;
    ($var_splash_progress_val > $var_splash_progress_max) && ($var_splash_progress_val = $var_splash_progress_max);

    my $progress = (65535 * $var_splash_progress_val) / $var_splash_progress_max;
    $self->splash_command(qq(progress $progress));
    $self->splash_command('repaint');

    return 1;
}

#===============================================================================
# mythdb_* functions.
#===============================================================================
sub _mythdb_condition
{
    my $self      = shift;
    my $prefix    = shift;
    my $separator = shift;
    my $condition = shift;
    my $flag      = shift;

    my $flag_condition_hostname = 1;
    if (defined $flag)
    {
        if (exists $flag->{'condition_hostname'}) { $flag_condition_hostname = $flag->{'condition_hostname'}; }
    }

    my $result = '';

    if ($flag_condition_hostname == 1)
    {
        my $hostname = $self->hostname();
        if (! $result) { $result .= ' ' . $prefix    . ' '; }
        else           { $result .= ' ' . $separator . ' '; }
        $result = $result . qq(hostname="$hostname");
    }

    foreach (keys %{$condition})
    {
        if (! $result) { $result .= ' ' . $prefix    . ' '; }
        else           { $result .= ' ' . $separator . ' '; }
        $result = $result . qq($_="$condition->{$_}");
    }

    return $result;
}

sub mythdb_handle
{
    my $self = shift;

    if (! defined $self->{'mythdb_handle'})
    {
        my $mythdb_handle;

        my $dbhostname = $self->var_get('MM_MASTER_SERVER');
        my $dbdatabase = $self->var_get('MM_MASTER_DBNAME');
        my $dbusername = $self->var_get('MM_MASTER_DBUSERNAME');
        my $dbpassword = $self->var_get('MM_MASTER_DBPASSWORD');

        my $dsn = "DBI:mysql:database=$dbdatabase;host=$dbhostname";

        $mythdb_handle = DBI->connect($dsn, $dbusername, $dbpassword);

        $self->{'mythdb_handle'} = $mythdb_handle;
    }

    return $self->{'mythdb_handle'};
}

sub mythdb_x_delete
{
    my $self      = shift;
    my $table     = shift;
    my $condition = shift;
    my $flag      = shift;

    my $query = qq(DELETE FROM $table) . $self->_mythdb_condition('WHERE', 'AND', $condition, $flag);

    $self->mythdb_handle->do($query);
}

sub mythdb_x_get
{
    my $self      = shift;
    my $table     = shift;
    my $condition = shift;
    my $field     = shift;
    my $flag      = shift;

    my $query = qq(SELECT * FROM $table) . $self->_mythdb_condition('WHERE', 'AND', $condition, $flag);

    my $sth = $self->mythdb_handle->prepare($query);
    my $result = undef;
    if ($sth->execute)
    {
        if (my $row = $sth->fetchrow_hashref())
        {
            $result = $row->{$field};
        }
    }
    $sth->finish();

    return $result;
}

sub mythdb_x_print
{
    my $self      = shift;
    my $table     = shift;
    my $condition = shift;
    my $flag      = shift;

    my $query = qq(SELECT * FROM $table) . $self->_mythdb_condition('WHERE', 'AND', $condition, $flag);

    my $sth = $self->mythdb_handle->prepare($query);
    my @rows = ();
    if ($sth->execute)
    {
        while (my $row = $sth->fetchrow_hashref())
        {
            push(@rows, $row);
        }
    }
    $sth->finish();
    my @fields = ();
    foreach my $field (keys %{$rows[0]})
    {
        if ($field !~ /^hostname$/)
        {
            push(@fields, $field);
        }
    }
    my %lengths;
    foreach my $field (@fields)
    {
        $lengths{$field} = length($field);
    }
    foreach my $row (@rows)
    {
        foreach my $field (@fields)
        {
            if ($lengths{$field} < length($row->{$field}))
            {
                $lengths{$field} = length($row->{$field});
            }
        }
    }
    @rows = sort { uc($a->{$fields[0]}) cmp uc($b->{$fields[0]}) } @rows;
    sub field_print
    {
        my $value  = shift;
        my $pad    = shift;
        my $length = shift;

        print "|" . $pad . $value;
        for ( $length -= length($value) ; $length > 0 ; $length-- )
        {
            print $pad;
        }
        print $pad;
    }
    foreach my $field (@fields) { field_print('-'   , '-', $lengths{$field}); } print "|" . "\n";
    foreach my $field (@fields) { field_print($field, ' ', $lengths{$field}); } print "|" . "\n";
    foreach my $field (@fields) { field_print('-'   , '-', $lengths{$field}); } print "|" . "\n";
    foreach my $row (@rows)
    {
        foreach my $field (@fields) { field_print($row->{$field}, ' ', $lengths{$field}); } print "|" . "\n";
    }
    foreach my $field (@fields) { field_print('-'   , '-', $lengths{$field}); } print "|" . "\n";
}

sub mythdb_x_set
{
    my $self      = shift;
    my $table     = shift;
    my $condition = shift;
    my $field     = shift;
    my $value     = shift;
    my $flag      = shift;

    my $query_delete = qq(DELETE FROM $table)                     . $self->_mythdb_condition('WHERE', 'AND', $condition, $flag);
    my $query_insert = qq(INSERT INTO $table SET $field="$value") . $self->_mythdb_condition(',',     ',',   $condition, $flag);

    $self->mythdb_handle->do($query_delete);
    $self->mythdb_handle->do($query_insert);
}

sub mythdb_x_test
{
    my $self = shift;

    my $test = 0;

    if ($self->mythdb_handle)
    {
        $test = 1;
    }

    return $test;
}

sub mythdb_x_update
{
    my $self      = shift;
    my $table     = shift;
    my $condition = shift;
    my $field     = shift;
    my $value     = shift;
    my $flag      = shift;

    my $query = qq(UPDATE $table SET $field="$value") . $self->_mythdb_condition('WHERE', 'AND', $condition, $flag);

    $self->mythdb_handle->do($query);
}

sub mythdb_jumppoints_delete
{
    my $self        = shift;
    my $destination = shift;

    if ($destination)
    {
        return $self->mythdb_x_delete('jumppoints', { 'destination' => $destination });
    }
    else
    {
        return $self->mythdb_x_delete('jumppoints', {});
    }
}

sub mythdb_jumppoints_print
{
    my $self        = shift;
    my $destination = shift;

    if ($destination)
    {
        return $self->mythdb_x_print('jumppoints', { 'destination' => $destination });
    }
    else
    {
        return $self->mythdb_x_print('jumppoints', {});
    }
}

sub mythdb_jumppoints_update
{
    my $self        = shift;
    my $destination = shift;
    my $keylist     = shift;

    return $self->mythdb_x_update('jumppoints', { 'destination' => $destination }, 'keylist', $keylist);
}

sub mythdb_jumppoints_get
{
    my $self  = shift;
    my $value = shift;

    return $self->mythdb_x_get('jumppoints', { 'value' => $value }, 'data');
}

sub mythdb_keybindings_delete
{
    my $self    = shift;
    my $context = shift;
    my $action  = shift;

    if    (($context) && ($action))
    {
        return $self->mythdb_x_delete('keybindings', { 'context' => $context, 'action' => $action });
    }
    elsif (($context))
    {
        return $self->mythdb_x_delete('keybindings', { 'context' => $context });
    }
    else
    {
        return $self->mythdb_x_delete('keybindings', {});
    }
}

sub mythdb_keybindings_print
{
    my $self    = shift;
    my $context = shift;
    my $action  = shift;

    if    (($context) && ($action))
    {
        return $self->mythdb_x_print('keybindings', { 'context' => $context, 'action' => $action });
    }
    elsif (($context))
    {
        return $self->mythdb_x_print('keybindings', { 'context' => $context });
    }
    else
    {
        return $self->mythdb_x_print('keybindings', {});
    }
}

sub mythdb_keybindings_update
{
    my $self    = shift;
    my $context = shift;
    my $action  = shift;
    my $keylist = shift;

    return $self->mythdb_x_update('keybindings', { 'context' => $context, 'action' => $action}, 'keylist', $keylist);
}

sub mythdb_music_playlists_print
{
    my $self  = shift;

    $self->mythdb_x_print('music_playlists', {});
}

sub mythdb_music_playlists_scope
{
    my $self          = shift;
    my $playlist_name = shift;
    my $scope         = shift;

    my $hostname = $self->hostname();

    my $query = '';
    if    ($scope eq 'local')
    {
        $query = qq(UPDATE music_playlists SET hostname="$hostname" WHERE playlist_name="$playlist_name");
    }
    elsif ($scope eq 'global')
    {
        $query = qq(UPDATE music_playlists SET hostname=""          WHERE playlist_name="$playlist_name");
    }
    $self->mythdb_handle->do($query);
}

sub mythdb_settings_delete
{
    my $self  = shift;
    my $value = shift;

    if ( $value ) { $self->mythdb_x_delete('settings', { 'value' => $value }); }
    else          { $self->mythdb_x_delete('settings', {});                    }
}

sub mythdb_settings_get
{
    my $self  = shift;
    my $value = shift;

    return $self->mythdb_x_get('settings', { 'value' => $value }, 'data');
}

sub mythdb_settings_print
{
    my $self  = shift;
    my $value = shift;

    if ( $value ) { $self->mythdb_x_print('settings', { 'value' => $value }); }
    else          { $self->mythdb_x_print('settings', {});                    }
}

sub mythdb_settings_set
{
    my $self  = shift;
    my $value = shift;
    my $data  = shift;

    $self->mythdb_x_set('settings', { 'value' => $value }, 'data', $data);
}

sub mythdb_settings_update
{
    my $self  = shift;
    my $value = shift;
    my $data  = shift;

    $self->mythdb_x_update('settings', { 'value' => $value }, 'data', $data);
}

sub mythfrontend_networkcontrol
{
    my $self    = shift;
    my $command = shift;

    my @lines = ();

    my $port = $self->mythdb_settings_get('NetworkControlPort');

    my $prompt = '/\# $/';
    my $telnet = new Net::Telnet('Timeout' => '10',
                                 'Errmode' => 'return',
                                 'Host'    => 'localhost',
                                 'Port'    => $port,
                                 'Prompt'  => $prompt);
    if ($telnet)
    {
        $telnet->waitfor($prompt);
        @lines = $telnet->cmd($command);
        $telnet->cmd('exit');
        $telnet->close;
        chomp @lines;
    }

    return \@lines;
}

#===============================================================================
# url_parse function.
#===============================================================================
sub url_parse
{
    my $self = shift;
    my $url  = shift;

    # Parse the URL.
    my    ($protocol, undef, undef, $username, undef, $password, $server , $path   , undef, $query   , undef, $fragment)
        = ($1 || '' , $2   , $3   , $4 || '' , $5   , $6 || '' , $7 || '', $8 || '', $9   , $10 || '', $11  , $12 || '')
        if ($url =~ /^([^:]+):(\/\/(([^:@]*)?(:([^@]*))?\@)?([^\/]+)\/)?([^?#]*)(\?([^#]*))?(\#(.*))?$/);

    return
    {
        'protocol' => $protocol,
        'username' => $username,
        'password' => $password,
        'server'   => $server,
        'path'     => $path,
        'query'    => $query,
        'fragment' => $fragment
    };
}

#===============================================================================
# url_expand function.
#===============================================================================
sub url_expand
{
    my $self = shift;
    my $url  = shift;

    # Parse the URL.
    my $url_parsed = $self->url_parse($url);
    my $protocol   = $url_parsed->{'protocol'};
    my $server     = $url_parsed->{'server'};
    my $file       = $url_parsed->{'path'};

    my @list = ();

    given ($protocol)
    {
        when (/^confro$/)
        {
            my $hostname = $self->hostname();
            my $file_0 = $file;
            $file_0 =~ s/\/+/\//g;
            $file_0 =~ s/^\///;
            if ($hostname)
            {
                push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . 'conf/' . $hostname . '/' . $file_0);
            }
            push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . 'conf/' .'default' . '/' . $file_0);
        }
        when (/^confrw$/)
        {
            my $hostname = $self->hostname();
            if ($hostname)
            {
                my $file_0 = $file;
                $file_0 =~ s/\/+/\//g;
                $file_0 =~ s/^\///;
                $file_0 =~ s/\//+/;
                push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . 'conf-rw/' . $hostname . '+' . $file_0);
            }
        }
        when (/^dist$/  )
        {
            if ($self->var_get('MM_ROOTFS_TYPE') eq 'squashfs')
            {
                if ($self->var_get('MM_ROOTFS_IMAGE'))
                {
                    my $file_0 = $self->var_get('MM_ROOTFS_IMAGE');
                    $file_0 =~ s/[^\/]+$//g;
                    $file_0 .= '/' . $file;
                    $file_0 =~ s/\/+/\//g;
                    $file_0 =~ s/^\///;
                    push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . $file_0);
                }
                else
                {
                    if ($self->var_get('MM_MINIMYTH_BOOT_URL') eq 'file:/minimyth/')
                    {
                        my $file_0 = $file;
                        $file_0 =~ s/\/+/\//g;
                        $file_0 =~ s/^\///;
                        push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . $file_0);
                    }
                    else
                    {
                        my $file_0 = 'minimyth-' . $self->var_get('MM_VERSION') . '/' . $file;
                        $file_0 =~ s/\/+/\//g;
                        $file_0 =~ s/^\///;
                        push(@list, $self->var_get('MM_MINIMYTH_BOOT_URL') . $file_0);
                    }
                    $self->message_log('info', qq(expanding '$url': guessed '$list[$#list]' because distribution location is unknown.));
                }
            }
        }
        when (/^file$/  )
        {
            push(@list, $url);
        }
        when (/^http$/  )
        {
            push(@list, $url);
        }
        when (/^hunt$/  )
        {
            push(@list, @{$self->url_expand('confrw:' . $file)});
            push(@list, @{$self->url_expand('confro:' . $file)});
            push(@list, @{$self->url_expand('dist:' . $file)});
        }
        when (/^tftp$/  )
        {
            push(@list, $url)
        }
        default
        {
            $self->message_log('err', qq(MiniMyth::url_expand: protocol '$protocol' is not supported.));
        }
    }

    return \@list;
}

#===============================================================================
# url_get function.
#===============================================================================
sub url_get
{
    my $self       = shift;
    my $url        = shift;
    my $local_file = shift;

    $self->message_log('info', qq(fetching '$url': local file will be '$local_file'.));

    my $result = '';

    $local_file =~ s/\/+/\//g;
    $local_file =~ s/\/$//g;

    unlink $local_file;
    if (-e $local_file)
    {
        $self->message_log('err', qq(fetching '$url': failed to remove existing local file '$local_file'.));
        return $result;
    }

    my $local_dir = $local_file;
    $local_dir =~ s/[^\/]*$//;
    $local_dir =~ s/\$//;
    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        $self->message_log('err', qq(fetching '$url': failed to create local directory '$local_dir'.));
        return $result;
    }

    my @url_list = @{$self->url_expand($url)};
    if ($#url_list < 0)
    {
        $self->message_log('err', qq(fetching '$url': URL '$url' did not expand to any valid URLs.));
    }

    for my $url_item (@url_list)
    {
        # Parse the URL.
        my $url_parsed      = $self->url_parse($url_item);
        my $remote_protocol = $url_parsed->{'protocol'};
        my $remote_server   = $url_parsed->{'server'};
        my $remote_file     = $url_parsed->{'path'};

        given ($remote_protocol)
        {
            when (/^file$/)
            {
                my $retcode = File::Copy::copy($remote_file, $local_file);
                if ( (-e $local_file) &&
                     ($retcode != 0)  )
                {
                    chmod(00600, $local_file);
                    $result = $url_item;
                }
            }
            when (/^http$/)
            {
                if (open(my $OUT_FILE, '>', $local_file))
                {
                    chmod(00600, $local_file);
                    my $curl = new WWW::Curl::Easy;
                    $curl->setopt(CURLOPT_VERBOSE, 0);
                    $curl->setopt(CURLOPT_URL, $url_item);
                    $curl->setopt(CURLOPT_FOLLOWLOCATION, 1);
                    $curl->setopt(CURLOPT_WRITEDATA, $OUT_FILE);
                    my $retcode = $curl->perform;
                    close($OUT_FILE);
                    if ( (-e $local_file)                            &&
                         ($retcode == 0)                             &&
                         ($curl->getinfo(CURLINFO_HTTP_CODE) == 200) )
                    {
                        $result = $url_item;
                    }
                }
            }
            when (/^tftp$/)
            {
                if (open(my $OUT_FILE, '>', $local_file))
                {
                    chmod(00600, $local_file);
                    my $curl = new WWW::Curl::Easy;
                    $curl->setopt(CURLOPT_VERBOSE, 0);
                    $curl->setopt(CURLOPT_URL, $url_item);
                    $curl->setopt(CURLOPT_WRITEDATA, $OUT_FILE);
                    my $retcode = $curl->perform;
                    close($OUT_FILE);
                    if ( (-e $local_file) &&
                         ($retcode == 0)  )
                    {
                        $result = $url_item;
                    }
                }
            }
            default
            {
                $self->message_log('info', qq(fetching '$url': URL '$url_item' has unknown protocol.));
            }
        }
        if ($result ne '')
        {
            $self->message_log('info', qq(fetching '$url': URL '$url_item' fetched.));
            last;
        }
        unlink $local_file;
        $self->message_log('info', qq(fetching '$url': URL '$url_item' not fetched \(it may not exist\).));
    }
    return $result;
}

#===============================================================================
# url_put function.
#===============================================================================
sub url_put
{
    my $self       = shift;
    my $url        = shift;
    my $local_file = shift;

    $self->message_log('info', qq(saving '$local_file': remote URL will be '$url'.));

    my $result = '';

    $local_file =~ s/\/+/\//g;
    $local_file =~ s/\/$//g;

    if (! -f $local_file)
    {
        $self->message_log('err', qq(saving '$local_file': file not found.));
        return $result;
    }

    my @url_list = @{$self->url_expand($url)};

    if ($#url_list < 0)
    {
        $self->message_log('err', qq(saving '$local_file': URL '$url' did not expand to any valid URLs.));
    }

    for my $url_item (@url_list)
    {
        # Parse the URL.
        my $url_parsed      = $self->url_parse($url_item);
        my $remote_protocol = $url_parsed->{'protocol'};
        my $remote_server   = $url_parsed->{'server'};
        my $remote_file     = $url_parsed->{'path'};

        given ($remote_protocol)
        {
            when (/^file$/  )
            {
                my $remote_dir = $remote_file;
                $remote_dir =~ s/[^\/]*$//;
                $remote_dir =~ s/\$//;
                File::Path::mkpath($remote_dir, { mode => 0755 });
                if (! -d $remote_dir)
                {
                    $self->message_log('err', qq(saving '$local_file': failed to create remote directory '$remote_dir'.));
                    return $result;
                }

                unlink $remote_file;
                if (-e $remote_file)
                {
                    $self->message_log('err', qq(saving '$local_file': failed to remove existing remote file '$remote_file'.));
                    return $result;
                }

                my $retcode = File::Copy::copy($local_file, $remote_file);
                if ( (-e $local_file) &&
                     ($retcode != 0)  )
                {
                    chmod(00600, $local_file);
                    $result = $url_item;
                }
            }
            when (/^http$/  )
            {
                if (open(my $IN_FILE, '<', $local_file))
                {
                    if (open(my $OUT_FILE, '>', File::Spec->devnull))
                    {
                        my $local_file_size = -s $local_file;
                        my $curl = new WWW::Curl::Easy;
                        $curl->setopt(CURLOPT_VERBOSE, 0);
                        $curl->setopt(CURLOPT_URL, $url_item);
                        $curl->setopt(CURLOPT_FOLLOWLOCATION, 1);
                        $curl->setopt(CURLOPT_INFILE, $IN_FILE);
                        $curl->setopt(CURLOPT_INFILESIZE, $local_file_size);
                        $curl->setopt(CURLOPT_WRITEDATA, $OUT_FILE);
                        $curl->setopt(CURLOPT_UPLOAD, 1);
                        # lighttpd < 1.5 does not support for the Expect request-header.
                        $curl->setopt(CURLOPT_HTTPHEADER, [ q(Expect:) ]);
                        my $retcode = $curl->perform;
                        close($OUT_FILE);
                        if ($retcode == 0)
                        {
                            $result = $url_item;
                        }
                    }
                    close($IN_FILE);
                }
            }
            when (/^tftp$/  )
            {
                if (open(my $IN_FILE, '<', $local_file))
                {
                    if (open(my $OUT_FILE, '>', File::Spec->devnull))
                    {
                        my $local_file_size = -s $local_file;
                        my $curl = new WWW::Curl::Easy;
                        $curl->setopt(CURLOPT_VERBOSE, 0);
                        $curl->setopt(CURLOPT_URL, $url_item);
                        $curl->setopt(CURLOPT_INFILE, $IN_FILE);
                        $curl->setopt(CURLOPT_INFILESIZE, $local_file_size);
                        $curl->setopt(CURLOPT_WRITEDATA, $OUT_FILE);
                        $curl->setopt(CURLOPT_UPLOAD, 1);
                        my $retcode = $curl->perform;
                        close($OUT_FILE);
                        if ($retcode == 0)
                        {
                            $result = $url_item;
                        }
                    }
                    close($IN_FILE);
                }
            }
            default
            {
                $self->message_log('info', qq(saving '$local_file': URL '$url_item' has unknown protocol.));
            }
        }
        if ($result ne '')
        {
            $self->message_log('info', qq(saving '$local_file': saved to URL '$url_item'.));
            last;
        }
        unlink $local_file;
        $self->message_log('info', qq(saving '$local_file': not saved to URL '$url_item' \(we may not have write access\).));
    }
    return $result;
}

#===============================================================================
# confro_* and mm_confrw_* functions.
#===============================================================================
sub confro_get
{
    my $self        = shift;
    my $remote_file = shift;
    my $local_file  = shift;

    my $result = $self->url_get('confro:' . $remote_file, $local_file);

    return $result;
}

sub confrw_get
{
    my $self        = shift;
    my $remote_file = shift;
    my $local_file  = shift;

    my $result = $self->url_get('confrw:' . $remote_file, $local_file);

    return $result;
}

sub confrw_put
{
    my $self        = shift;
    my $remote_file = shift;
    my $local_file  = shift;

    my $result = $self->url_put('confrw:' . $remote_file, $local_file);

    return $result;
}

#-------------------------------------------------------------------------------
# url_mount
#
# This function mounts a remote directory as a local directory.
#
# This function takes three arguments:
#     URL: required argument:
#         A URL that points to the remote directory. A URL must have the
#         following form:
#             <protocol>://<username>:<password>@<server>/<path>?<options>
#         where <options> are additional mount options (-o).
#         For example:
#             nfs://server.home/home/public/music
#             cifs://user:pass@server.home/home/public/music,domain=home
#             confrw:themecaches/G.A.N.T..1024.768.sfs<br/>
#         The valid protocol values are: 'cifs', 'nfs', 'ext2', 'ext3', 'ext4', 
#         'http', 'tftp', 'confro', 'confrw', 'dist', 'hunt' and 'file'. For
#         'cifs' and 'nfs' the URL points to a remote directory. For 'ext2',
#         'ext3' and "ext4' the URL points to a local ext2, ext3 or ext4 device.
#         For 'http', 'tftp', confro', 'confrw', 'dist' and 'hunt', the URL
#         points to a remote file.  For 'file', the URL point to a local
#         directory or file. A directory will be mounted at the mount point. A
#         file, which can be a squashfs image (*.sfs.), cramfs image (*.cmg) or
#         a tarball file (*.tar.bz2) will be downloaded and mounted at
#         (for *.sfs and *.cmg files) or downloaded and expanded into
#         (for *.tar.bz2 files) the mount point.  The 'confro', 'confrw', 'dist'
#         and 'hunt' are special MiniMyth specific URLs. A 'dist' URL causes
#         MiniMyth to look for the file in the MiniMyth distribution directory
#         (the directory with the MiniMyth root file system squashfs image). A
#         'confro' URL causes MiniMyth to look for the file in the MiniMyth
#         read-only configuration directory.  A 'confrw' URL causes MiniMyth to
#         look for the file in the MiniMyth read-write configuration directory.
#         A 'hunt' URL causes MiniMyth to look for the file first in the
#         MiniMyth read-write, second in the MiniMyth read-only configuration
#         directory and third in the MiniMyth distribution directory.
#         configuration directory.
#     MOUNT_DIR: required argument:
#         The local directory (e.g. /mnt/music) where the URL will be mounted.
#-------------------------------------------------------------------------------
sub url_mount
{
    my $self      = shift;
    my $url       = shift;
    my $mount_dir = shift;

    if (! -e $mount_dir)
    {
        File::Path::mkpath($mount_dir, { mode => 0755 }) || return 0;
    }

    # Parse the URL.
    my $url_parsed   = $self->url_parse($url);
    my $url_protocol = $url_parsed->{'protocol'};
    my $url_username = $url_parsed->{'username'};
    my $url_password = $url_parsed->{'password'};
    my $url_server   = $url_parsed->{'server'};
    my $url_path     = $url_parsed->{'path'};
    my $url_options  = $url_parsed->{'query'};

    my $url_file = File::Basename::basename($url_path);
    my $url_ext  = $url_file;
    my @url_exts = split(/\./, $url_file); shift(@url_exts);
    my $url_ext1 = pop(@url_exts);
    my $url_ext2 = pop(@url_exts);

    my $mount_vfstype = '';
    my $extra_options = '';
    my $mount_device  = '';
    my $mount_options = $url_options;
    if    ($url_protocol eq 'cifs')
    {
        $mount_vfstype = 'cifs';
        $mount_device  = '//' . $url_server . '/' . $url_path;
        $mount_options = 'cache=' . 'strict' . ',' . $mount_options;
        $mount_options = 'sec=' . 'ntlmv2i' . ',' . $mount_options;
        if ($url_password ne '')
        {
            $mount_options = 'password=' . $url_password . ',' . $mount_options;
        }
        if ($url_username ne '')
        {
            $mount_options = 'username=' . $url_username . ',' . $mount_options;
        }
    }
    elsif ($url_protocol eq 'nfs')
    {
        $mount_vfstype = 'nfs';
        $mount_device  = $url_server . ':' . '/' . $url_path;
        $mount_options = 'nolock,' . $mount_options;
    }
    elsif ($url_protocol eq 'ext2')
    {
        $mount_vfstype = 'ext2';
        $mount_device  = '/' . $url_path;
        $mount_options = $mount_options;
    }
    elsif ($url_protocol eq 'ext3')
    {
        $mount_vfstype = 'ext3';
        $mount_device  = '/' . $url_path;
        $mount_options = $mount_options;
    }
    elsif ($url_protocol eq 'ext4')
    {
        $mount_vfstype = 'ext4';
        $mount_device  = '/' . $url_path;
        $mount_options = $mount_options;
    }
    elsif (( $url_protocol eq 'confro'                   ) ||
           ( $url_protocol eq 'confrw'                   ) ||
           ( $url_protocol eq 'dist'                     ) ||
           (($url_protocol eq 'file'  ) && (-f $url_path)) ||
           ( $url_protocol eq 'http'                     ) ||
           ( $url_protocol eq 'hunt'                     ) ||
           ( $url_protocol eq 'tftp'                     ))
    {
        if    ($url_ext1 eq 'sfs')
        {
            my $dir  = $mount_dir;
            $dir =~ s/\/+/~/g;
            $dir = "/initrd/rw/loopfs/$dir";
            my $file = 'image.sfs';
            File::Path::mkpath("$dir", { mode => 0755 });
            File::Path::mkpath("$dir/ro", { mode => 0755 });
            File::Path::mkpath("$dir/rw", { mode => 0755 });
            $self->url_get($url, "$dir/$file") || return 0;
            system(qq(/bin/mount -t squashfs -o ro,loop "$dir/$file" "$dir/ro")) && return 0;
            system(qq(/bin/mount -t overlayfs -o lowerdir=$dir/ro,upperdir=$dir/rw none "$mount_dir")) && return 0;
        }
        elsif ($url_ext1 eq 'cmg')
        {
            my $dir  = $mount_dir;
            $dir =~ s/\/+/~/g;
            $dir = "/initrd/rw/loopfs/$dir";
            my $file = 'image.cmg';
            File::Path::mkpath("$dir", { mode => 0755 });
            File::Path::mkpath("$dir/ro", { mode => 0755 });
            File::Path::mkpath("$dir/rw", { mode => 0755 });
            $self->url_get($url, "$dir/$file") || return 0;
            system(qq(/bin/mount -t cramfs -o ro,loop "$dir/$file" "$dir/ro")) && return 0;
            system(qq(/bin/mount -t overlayfs -o lowerdir=$dir/ro,upperdir=$dir/rw none "$mount_dir")) && return 0;
        }
        elsif (($url_ext1 eq 'bz2') && ($url_ext2 eq 'tar'))
        {
            my $dir  = $mount_dir;
            my $file = "tmp.tar.bz2~";
            $self->url_get($url, "$dir/$file") || return 0;
            system(qq(/bin/tar -C "$dir" -jxf "$dir/$file")) && return 0;
            unlink("$dir/$file") || return 0;
        }
    }
    elsif (($url_protocol eq 'file'  ) && (-d $url_path))
    {
        system(qq(/bin/mount --rbind "$url_path" "$mount_dir")) && return 0;
    }
    else
    {
        $self->message_log('err', qq(MiniMyth::url_mount: protocol ') . $url_protocol . qq(' is not supported.));
        return 0;
    }

    if ($mount_vfstype)
    {
        my $options = '';
        $mount_options =~ s/^,//;
        $mount_options =~ s/,$//;
        $mount_options =~ s/^ +//;
        $mount_options =~ s/ +$//;
        ($extra_options) && ($options = $extra_options);
        ($mount_options) && ($options = $options . ' -o ' . $mount_options);
        $options =~ s/^ +//;
        $options =~ s/ +$//;
        system(qq(/bin/mount -n -t "$mount_vfstype" $options "$mount_device" "$mount_dir")) && return 0;
    }

    return 1;
}

sub file_replace_variable
{
    my $self  = shift;
    my $file  = shift;
    my $vars  = shift;

    my $mode = (stat($file))[2];
    my $uid  = (stat(_))[4];
    my $gid  = (stat(_))[5];
    if ((! -e "$file.$$") && (open(OFILE, '>', "$file.$$")))
    {
        chmod($mode, "$file.$$");
        chown($uid, $gid, "$file.$$");
        if ((-r "$file") && (open(IFILE, '<', "$file")))
        {
            while (<IFILE>)
            {
                my $line = $_;
                foreach (keys %{$vars})
                {
                    my $name  = $_;
                    my $value = $vars->{$_};
                    $line =~ s/$name/$value/g;
                }
                print OFILE $line;
            }
            close(IFILE);
        }
        close(OFILE);
    }
    unlink("$file");
    rename("$file.$$", "$file");
}

#===============================================================================
# Restore and Save functions.
#===============================================================================
sub game_restore
{
    my $self = shift;

    my $file        = 'game.tar';
    my $remote_file = $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    unlink($local_file);

    $self->confrw_get($remote_file, $local_file);

    if (! -e $local_file)
    {
        return 0;
    }

    system(qq(/bin/tar -C /home/minimyth -xf $local_file));

    unlink($local_file);

    return 1;
}

sub game_save
{
    my $self = shift;

    my $file        = 'game.tar';
    my $remote_file = $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    # Enumerate all the files to be saved.
    my @game_save_list =();
    my @game_save_full = split(':', $self->var_get('MM_GAME_SAVE_LIST'));
    foreach (@game_save_full)
    {
        if (-e '/home/minimyth/' . $_)
        {
            push(@game_save_list, $_);
        }
    }
    my $game_save_list = join(' ', @game_save_list);

    if ($game_save_list)
    {
        File::Path::mkpath('/home/minimyth', { mode => 0755 });
        unlink ($local_file);
        if (system(qq(/bin/tar -C '/home/minimyth' -cf $local_file $game_save_list)) != 0)
        {
            unlink ($local_file);
        }

        if (! -e $local_file)
        {
            $self->message_log('err', "failed to create game files tarball.");
            return 0;
        }

        if (! $self->confrw_put($remote_file, $local_file))
        {
            unlink ($local_file);
            $self->message_log('err', qq(failed to save game files file.));
            return 0;
        }

        unlink ($local_file);
    }

    return 1;
}

sub codecs_fetch_and_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    my $file        = undef;
    my $codecs_base = undef;
    if    (-e q(/lib/ld-linux.so.2))
    {
        $file        = q(codecs.32.sfs);
        $codecs_base = q(essential-20071007);
    }
    elsif (-e q(/lib/ld-linux-x86-64.so.2))
    {
        $file        = q(codecs.64.sfs);
        $codecs_base = qq(essential-amd64-20071007);
    }
    else
    {
        $self->message_log('err', qq(failed to create binary codecs file because could not determine required file format.));
        return 0;
    }

    my $remote_file = $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    my $codecs_file = qq($codecs_base.tar.bz2);
    my $codecs_url  = qq(http://www.mplayerhq.hu/MPlayer/releases/codecs/$codecs_file);
    File::Path::rmtree(qq($local_dir/$codecs_base));
    unlink(qq($local_dir/$codecs_file));
    $self->message_log('info', qq(downloading binary codecs file '$codecs_url'.));
    if (! $self->url_get($codecs_url, qq($local_dir/$codecs_file)))
    {
        $self->message_log('err', qq(failed to create binary codecs file because no codecs were downloaded.));
        File::Path::rmtree(qq($local_dir/$codecs_base));
        unlink(qq($local_dir/$codecs_file));
        return 0;
    }
    system(qq(/bin/tar -C $local_dir -jxf $local_dir/$codecs_file));
    unlink(qq($local_dir/$codecs_file));

    if (! -d "$local_dir/$codecs_base")
    {
        my $file_found = 0;
        if (opendir(DIR, "$local_dir/$codecs_base"))
        {
            foreach (grep(! /^\./, (readdir(DIR))))
            {
                $file_found = 1;
                last;
            }
            closedir(DIR);
        }
        if (! $file_found)
        {
            $self->message_log('err', qq(failed to create binary codecs file because downloaded codecs file was empty.));
            File::Path::rmtree(qq($local_dir/$codecs_base));
            return 0;
        }
    }

    my $uid = getpwnam('minimyth');
    my $gid = getgrnam('minimyth');
    File::Find::finddepth(
        sub
        {
            chown($uid, $gid, $File::Find::name);
            if (-d $File::Find::name)
            {
                chmod(00755, $File::Find::name);
            }
            else
            {
                chmod(00644, $File::Find::name);
            }
        },
        "$local_dir/$codecs_base");

    unlink(qq($local_file));
    if (system(qq(/usr/bin/fakeroot /usr/bin/mksquashfs "$local_dir/$codecs_base" "$local_file" -no-exports -no-progress -force-uid 0 -force-gid 0 > "$devnull" 2>&1)) != 0)
    {
        File::Path::rmtree(qq($local_dir/$codecs_base));
        unlink(qq($local_file));
        $self->message_log('err', qq(failed to create binary codecs file because squashfs failed.));
        return 0;
    }

    if (! $self->confrw_put($remote_file, $local_file))
    {
        unlink(qq($local_file));
        $self->message_log('err', qq(failed to save binary codecs file.));
        return 0;
    }
    $self->message_log('info', qq(saved binary codecs file 'confrw:$remote_file'.));

    unlink(qq($local_file));

    return 1;
}

sub flash_fetch_and_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    my $flash_file = undef;
    my $flash_url  = undef;
    if    (-e q(/lib/ld-linux.so.2))
    {
        $flash_file = q(libflashplayer.32.so);
        # 11.1 release.
        $flash_url = q(http://fpdownload.macromedia.com/get/flashplayer/pdc/11.1.102.62/install_flash_player_11_linux.i386.tar.gz);
        # 11.2 release.
        #$flash_url = q(http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.236/install_flash_player_11_linux.i386.tar.gz);
    }
    elsif (-e q(/lib/ld-linux-x86-64.so.2))
    {
        $flash_file = q(libflashplayer.64.so);
        # 11.1 release.
        $flash_url = q(http://fpdownload.macromedia.com/get/flashplayer/pdc/11.1.102.62/install_flash_player_11_linux.x86_64.tar.gz);
        # 11.2 release.
        #$flash_url = q(http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.236/install_flash_player_11_linux.x86_64.tar.gz);
    }
    else
    {
        $self->message_log('err', qq(failed to create Adobe Flash player file because could not determine required file format.));
        return 0;
    }

    my $local_dir = $ENV{'HOME'} . '/' . 'tmp' . '/' . 'flash' ;

    File::Path::rmtree($local_dir);

    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        File::Path::rmtree(qq($local_dir));
        $self->message_log('err', qq(failed to create the Adobe Flash Player file.));
        return 0;
    }

    $self->message_log('info', qq(downloading Adobe Flash Player file '$flash_url'.));
    if (! $self->url_get($flash_url, qq($local_dir/flash.tar.gz)))
    {
        File::Path::rmtree(qq($local_dir));
        $self->message_log('err', qq(failed to create the Adobe Flash Player file.));
        return 0;
    }
    system(qq(/bin/tar -C $local_dir -zxf $local_dir/flash.tar.gz));

    if (! -e qq($local_dir/libflashplayer.so))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to create the Adobe Flash Player file.));
        return 0;
    }

    if (! $self->confrw_put(qq($flash_file), qq($local_dir/libflashplayer.so)))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to save the Adobe Flash Player file.));
        return 0;
    }
    $self->message_log('info', qq(saved Adobe Flash Player file 'confrw:$flash_file'.));

    File::Path::rmtree($local_dir);

    return 1;
}

sub hulu_fetch_and_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    my $hulu_file = undef;
    my $hulu_url  = undef;
    if    (-e q(/lib/ld-linux.so.2))
    {
        $hulu_file = q(huludesktop.32);
        $hulu_url  = qq(http://download.hulu.com/huludesktop_i386.deb);
    }
    elsif (-e q(/lib/ld-linux-x86-64.so.2))
    {
        $hulu_file = q(huludesktop.64);
        $hulu_url  = qq(http://download.hulu.com/huludesktop_amd64.deb);
    }
    else
    {
        $self->message_log('err', qq(failed to create Hulu Desktop file because could not determine required file format.));
        return 0;
    }

    my $local_dir = $ENV{'HOME'} . '/' . 'tmp' . '/' . 'hulu';

    File::Path::rmtree(qq($local_dir));
    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to create the Hulu Desktop file.));
        return 0;
    }

    $self->message_log('info', qq(downloading Hulu Desktop file '$hulu_url'.));
    if (! $self->url_get($hulu_url, qq($local_dir/hulu.deb)))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to create the Hulu Desktop file.));
        return 0;
    }
    system(qq(cd $local_dir ; /usr/bin/ar -x hulu.deb));

    if (! -e qq($local_dir/data.tar.gz))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to create the Hulu Desktop file.));
        return 0;
    }
    system(qq(/bin/tar -C $local_dir -zxf $local_dir/data.tar.gz));
    if (! -e qq($local_dir/usr/bin/huludesktop))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to create the Hulu Desktop file.));
        return 0;
    }
    if (! $self->confrw_put(qq($hulu_file), qq($local_dir/usr/bin/huludesktop)))
    {
        File::Path::rmtree($local_dir);
        $self->message_log('err', qq(failed to save the Hulu Desktop file.));
        return 0;
    }
    $self->message_log('info', qq(saved Hulu Desktop file 'confrw:$hulu_file'.));

    File::Path::rmtree($local_dir);

    return 1;
}

sub extras_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    if (! -d '/usr/local')
    {
        $self->message_log('err', qq(failed to create the extras file because the extras directory does not exist.));
        return 0;
    }
    my $file_found = 0;
    if (opendir(DIR, '/usr/local'))
    {
        foreach (grep(! /^\./, (readdir(DIR))))
        {
            $file_found = 1;
            last;
        }
        closedir(DIR);
    }
    if (! $file_found)
    {
        $self->message_log('err', qq(failed to create the extras file because the extras directory is empty.));
        return 0;
    }

    my $file        = 'extras.sfs';
    my $remote_file = $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    unlink($local_file);
    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    if (system(qq(/usr/bin/fakeroot /usr/bin/mksquashfs '/usr/local' "$local_file" -no-exports -no-progress -force-uid 0 -force-gid 0 -ckeck_data > "$devnull" 2>&1)) != 0)
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to create the extras file because squashfs failed.));
        return 0;
    }

    if (! $self->confrw_put($remote_file, $local_file))
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to save the extras file.));
        return 0;
    }

    unlink($local_file);

    return 1;
}

sub theme_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    my $theme_name = $self->var_get('MM_THEME_NAME');

    my $theme_path = '';
    if (($theme_path =~ /^$/) && (-d qq(/home/minimyth/.mythtv/themes/$theme_name)))
    {
        $theme_path = qq(/home/minimyth/.mythtv/themes/$theme_name);
    }
    if (($theme_path =~ /^$/) && (-d qq(/usr/share/mythtv/themes/$theme_name)))
    {
        $theme_path = qq(/usr/share/mythtv/themes/$theme_name);
    }
    if ($theme_path =~ /^$/)
    {
        $self->message_log('err', qq(failed to create the MythTV theme file because the MythTV theme "$theme_name" does not exist.));
        return 0;
    }

    my $file        = $theme_name . '.sfs';
    my $remote_file = 'themes+' . $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    unlink($local_file);
    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    my $uid = getpwnam('minimyth');
    my $gid = getgrnam('minimyth');
    if (system(qq(/usr/bin/fakeroot /usr/bin/mksquashfs '/home/minimyth/.mythtv/themes/$theme_name' "$local_file" -no-exports -no-progress -force-uid $uid -force-gid $gid > "$devnull" 2>&1)) != 0)
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to create the MythTV theme file because squashfs failed.));
        return 0;
    }

    if (! $self->confrw_put($remote_file, $local_file))
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to save the MythTV theme file.));
        return 0;
    }

    unlink($local_file);

    return 1;
}

sub themecache_save
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    if (! -d '/home/minimyth/.mythtv/themecache')
    {
        $self->message_log('err', qq(failed to create the MythTV themecache file because the MythTV themecache directory does not exist.));
        return 0;
    }

    my $file        = 'themecache.sfs';
    my $remote_file = $file;
    my $local_dir   = $ENV{'HOME'} . '/' . 'tmp';
    my $local_file  = $local_dir . '/' . $file;

    unlink($local_file);
    File::Path::mkpath($local_dir, { mode => 0755 });
    if (! -d $local_dir)
    {
        return 0;
    }

    my $uid = getpwnam('minimyth');
    my $gid = getgrnam('minimyth');
    if (system(qq(/usr/bin/fakeroot /usr/bin/mksquashfs '/home/minimyth/.mythtv/themecache' "$local_file" -no-exports -no-progress -force-uid $uid -force-gid $gid > "$devnull" 2>&1)) != 0)
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to create the MythTV themecache file because squashfs failed.));
        return 0;
    }

    if (! $self->confrw_put($remote_file, $local_file))
    {
        unlink($local_file);
        $self->message_log('err', qq(failed to save the MythTV themecache file.));
        return 0;
    }

    unlink($local_file);

    return 1;
}

#===============================================================================
# X functions.
#===============================================================================
sub x_screensaver_deactivate
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    system(qq(/usr/bin/xset s reset));
    if ($self->application_running('xscreensaver'))
    {
        system(qq(/usr/bin/xscreensaver-command -deactivate > $devnull 2>&1));
    }

    return 1;
}

sub x_xmacroplay
{
    my $self    = shift;
    my $program = shift;
    my $xmacro  = shift;

    my $devnull = File::Spec->devnull;

    # Make sure that the program is running.
    if ($self->application_running($program))
    {
        # Make sure that the X window manager is running, since we depend on it to select the program window.
        if ($self->application_running('ratpoison'))
        {
            # Set ratpoison to select window by program name.
            system(qq(/usr/bin/ratpoison -d :0.0 -c "set winname class"));
            # Select the program window.
            system(qq(/usr/bin/ratpoison -d :0.0 -c "select $program"));
            # Make sure the program window is selected.
            my $window = '';
            if (open(FILE, '-|', qq(/usr/bin/ratpoison -d :0.0 -c 'info' 2> $devnull)))
            {
                while (<FILE>)
                {
                    chomp;
                    if (/^.*\(([^()]*)\)$/)
                    {
                        $window = $1;
                        last;
                    }
                }
                close(FILE);
            }
            if ($window eq $program)
            {
                # Send key sequence to window.
                if (open(FILE, '|-', "/usr/bin/xmacroplay -d 100 :0.0 > $devnull 2>&1"))
                {
                    foreach (@{$xmacro})
                    {
                        print FILE $_ . "\n";
                    }
                    close(FILE);
                }
            }
        }
        else
        {
            $self->message_output('err', "cannot command '$program' without X window manager enabled.");
        }
    }

    return 1;
}

# Expand the applications list.
#
# The applications list contains names of applications or names of application
# groups. Application groups are identified by preceeding them with a ':'. The
# following groups:
#   :everything
#   :browser
#   :game
#   :player
#   :terminal
sub x_applications_list
{
    my $self         = shift;
    my @applications = @_;

    my @browser    = ( 'mythbrowswer');
    my @game       = ( 'fceu', 'mame', 'mess', 'mednafen', 'stella', 'VisualBoyAdvance', 'zsnes');
    my @player     = ( 'mplayer', 'mplayer-stable', 'mplayer-svn', 'mythtv', 'vlc', 'xine' );
    my @terminal   = ( 'rxvt' );
    my @everything = ( @browser, @game, @player, @terminal );

    my @expanded = ();

    # Expand application groups to application names.
    foreach (@applications)
    {
        given ($_)
        {
            when(/^:browser$/)    { push(@expanded, @browser);    }
            when(/^:game$/)       { push(@expanded, @game);       }
            when(/^:player$/)     { push(@expanded, @player);     }
            when(/^:terminal$/)   { push(@expanded, @terminal);   }
            when(/^:everything$/) { push(@expanded, @everything); }
            default               { push(@expanded, $_);          }
        }
    }

    return @expanded;
}

# Exit all applications in the list, assuming that we know how.
sub x_applications_exit
{
    my $self         = shift;
    my @applications = $self->x_applications_list(@_);

    foreach my $application (@applications)
    {
        if ($self->application_running($application))
        {
            my @xmacro = ();
            given ($application)
            {
                # Myth
                when (/^mythfrontend$/)
                {
                    # If mythfrontend is running, then return it to the Main Menu using the Network Control interface.
                    if ($self->application_running('mythfrontend'))
                    {
                        for (my $timeout = 10 ; $timeout > 0 ; $timeout--)
                        {
                            my $mythfrontend_location = lc(join("\n", @{$self->mythfrontend_networkcontrol('query location')}));
                            if ($mythfrontend_location eq 'mainmenu')
                            {
                                last;
                            }
                            $self->mythfrontend_networkcontrol('jump mainmenu');
                            sleep 1;
                        }
                    }
                }
                # Browsers
                when (/^mythbrowser$/)      { push(@xmacro, 'KeyStr Escape'); }
                # Players
# Does not work because huludesktop does not have a key sequence to quit.
#               when (/^huludesktop$/)      { push(@xmacro, );                }
                when (/^mplayer$/)          { push(@xmacro, 'KeyStr Escape'); }
                when (/^mplayer-svn$/)      { push(@xmacro, 'KeyStr Escape'); }
                when (/^mplayer-vld$/)      { push(@xmacro, 'KeyStr Escape'); }
                when (/^mythtv$/)           { push(@xmacro, 'KeyStr Escape'); }
                when (/^vlc$/)
                {
                    push(@xmacro, 'KeyStrPress Control_L', 'KeyStrPress Q', 'KeyStrRelease Q', 'KeyStrRelease Control_L');
                }
                when (/^xine$/)             { push(@xmacro, 'KeyStr Q');      }
                # Games
                when (/^fceu$/)             { push(@xmacro, 'KeyStr Escape'); }
                when (/^jzintv$/)           { push(@xmacro, 'KeyStr F1');     }
                when (/^mame$/)             { push(@xmacro, 'KeyStr Escape'); }
                when (/^mess$/)             { push(@xmacro, 'KeyStr Escape'); }
                when (/^mednafen$/)         { push(@xmacro, 'KeyStr Escape'); }
                when (/^stella$/)
                {
                    push(@xmacro, 'KeyStrPress Control_L', 'KeyStrPress Q', 'KeyStrRelease Q', 'KeyStrRelease Control_L');
                }
                when (/^VisualBoyAdvance$/) { push(@xmacro, 'KeyStr Escape'); }
                when (/^zsnes$/)            { push(@xmacro, 'KeyStr Escape', 'KeyStr Q', 'KeyStr Return'); }
                # Terminals
# Does not work because rxvt does not have a key sequence to quit.  Also, the window is named 'xterm' not 'rxvt'.
#               when (/^rxvt$/)             { push(@xmacro, '');              }
            }
            if (@xmacro)
            {
                $self->x_xmacroplay($application, \@xmacro);
                if ($self->application_running($application))
                {
                    $self->message_output('err', "failed to exit '$application'.");
                }
            }
        }
    }

    return 1;
}

# Kill all applications in the list.
sub x_applications_kill
{
    my $self         = shift;
    my @applications = $self->x_applications_list(@_);

    foreach my $application (@applications)
    {
        if (open(FILE, '-|', "/bin/pidof $application"))
        {
            while (<FILE>)
            {
                my $devnull = File::Spec->devnull;
                system(qq(/bin/kill -SIGTERM $_ > $devnull 2>&1));
            }
            close(FILE);
        }
    }

    return 1;
}

# Wait until all applications in the list are dead.
sub x_applications_dead
{
    my $self         = shift;
    my @applications = $self->x_applications_list(@_);

    my $dead = 0;
    while ($dead == 0)
    {
        $dead = 1;
        foreach (@applications)
        {
            if ($self->application_running($_))
            {
                my $dead = 0;
                sleep 1;
            }
        }
    }

    return 1;
}

# Start X.
sub x_start
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    $self->message_log('info', "starting X");

    # Only user root can start X.
    my $user = '';
    if (open(FILE, '-|', '/usr/bin/id -u'))
    {
        while (<FILE>)
        {
            chomp;
            $user = getpwuid($_);
            last;
        }
        close(FILE);
    }
    if ($user ne 'root')
    {
        $self->message_log('info', "X not started because uid=$user is not 'root'.");
        return 0;
    }

    # Only start X if X is enabled.
    if ($self->var_get('MM_X_ENABLED') ne 'yes')
    {
        $self->message_log('info', "X not started because X not enabled in minimyth.conf.");
        return 0;
    }

    # Only start X if X is not already running.
    if ($self->application_running('X'))
    {
        $self->message_log('info', "X not started because X is already running.");
        return 0;
    }

    system(qq(/bin/su -c '/usr/bin/nohup /usr/bin/xinit > $devnull 2>&1 &' - minimyth));

    $self->application_stop('mm_sleep_on_ss');
    $self->application_stop('mm_off_on_ss');
    if ($self->var_get('MM_X_SCREENSAVER_HACK') eq 'sleep')
    {
        system(qq(/usr/bin/mm_sleep_on_ss));
    }
    if ($self->var_get('MM_X_SCREENSAVER_HACK') eq 'off')
    {
        system(qq(/usr/bin/mm_off_on_ss));
    }

    return 1;
}

# Stop X.
sub x_stop
{
    my $self = shift;

    my $devnull = File::Spec->devnull;

    $self->message_log('info', "stopping X");

    my $log_file = File::Spec->devnull;

    # Only user root can stop X.
    my $user = '';
    if (open(FILE, '-|', '/usr/bin/id -u'))
    {
        while (<FILE>)
        {
            chomp;
            $user = getpwuid($_);
            last;
        }
        close(FILE);
    }
    if ($user ne 'root')
    {
        $self->message_log('info', "X not stopped because uid=$user is not 'root'.");
        return 0;
    }

    $self->application_stop('mm_sleep_on_ss');
    $self->application_stop('mm_off_on_ss');

    # Only stop X if X is running.
    if (! $self->application_running('X'))
    {
        $self->message_log('info', "X not stopped because X is not running.");
        return 0;
    }

    # Exit X applications that are known not to be started by xinit
    $self->x_applications_exit(':everything');
    $self->x_applications_kill(':everything');
    $self->x_applications_dead(':everything');

    # Return mythfrontend to the main menu
    $self->x_applications_exit('mythfrontend');

    # Create the list of X applications that may have been started by xinit but are not keeping X alive,
    # then them and wait for them to die.
    {
        my $myth_program = $self->var_get('MM_X_MYTH_PROGRAM');
        # Create a list of all applications that xinit might start.
        my @applications = ();
        push(@applications, $myth_program);
        push(@applications, 'irxevent');
        push(@applications, 'irxkeys');
        push(@applications, 'mythfrontend');
        push(@applications, 'mythwelcome');
        push(@applications, 'ratpoison');
        push(@applications, 'X');
        push(@applications, 'x11vnc');
        push(@applications, 'xinit');
        push(@applications, 'xscreensaver');
        # Remove applications that might be keeping X alive.
        @applications = grep(!/^xinit|X|$myth_program$/, @applications);
        # Kill them and wait for them to die.
        $self->x_applications_kill(@applications);
        $self->x_applications_dead(@applications);
    }

    # Create the list of xlsclients X applications but are not keeping X alive,
    # then kill them and wait for them to die.
    #   All of these should have been killed when we killed the list of known X applications not keeping X alive.
    #   However, there may be some unknown X applications not keeping X alive that we need to kill.
    if (open(FILE, '-|', "/usr/bin/xlsclients -display ':0.0' -a 2> $devnull"))
    {
        my $myth_program = $self->var_get('MM_X_MYTH_PROGRAM');
        # Create a list of xlsclients X applications.
        my @applications = ();
        while (<FILE>)
        {
            chomp;
            s/^([^ ]+) +([^ ]+)( .*)?$/$2/;
            s/^.*\///;
            push(@applications, $_);
        }
        # Remove applications that might be keeping X alive.
        @applications = grep(!/^xinit|X|$myth_program$/, @applications);
        # Kill them and wait for them to die.
        $self->x_applications_kill(@applications);
        $self->x_applications_dead(@applications);
    }

    # Create the list of the known X applications keeping X alive, kill them and wait for them to die.
    {
        my $myth_program = $self->var_get('MM_X_MYTH_PROGRAM');
        my @applications = ();
        push(@applications, $myth_program);
        $self->x_applications_kill(@applications);
        $self->x_applications_dead(@applications);
    }

    # Create the list of remaining known X applications and wait for them to die.
    {
        my @applications = ();
        push(@applications, 'xinit');
        push(@applications, 'X');
        $self->x_applications_dead(@applications);
    }

    return 1;
}

# package require
sub package_require
{
    my $self    = shift;
    my $package = shift;

    if (! eval(qq(require $package)))
    {
        my $message = $@;

        $self->message_output('err', qq('require $package' failed.));

        if ($message)
        {
            my $logfile = qq(/var/log/$package.require.log);
            if (open(FILE, '>', $logfile))
            {
                print FILE $message;
                close(FILE);
                $self->message_output('err', qq(ckeck '$logfile' for details.));
            }
        }
        return 0;
    }

    return 1;
}

#===============================================================================
# Perl package functions.
#===============================================================================
sub package_member_require
{
    my $self    = shift;
    my $package = shift;
    my $member  = shift;

    if (! $self->package_member_exists($package, $member))
    {
        my $function = $package . '::' . $member;
        $self->message_output('err', qq('$function' does not exist.));
        return 0;
    }

    return 1;
}

sub package_member_exists
{
    my $self    = shift;
    my $package = shift;
    my $member  = shift;

    my $function = $package . '::' . $member;

    return exists(&$function);
}

1;
