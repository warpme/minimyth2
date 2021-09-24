#!/usr/bin/perl

use threads;
use threads::shared;
use Perl::Strip;

our $VERBOSE=0;
our $OPTIMISE_SIZE=1;
our $CACHE=0;
our $CACHEDIR;
our $OUTPUT;

my $ThreadCount;
my @DirectoryList;
my @cache;

($ThreadCount, @DirectoryList) = @ARGV;

my @FileList     :shared;
my $FileListLock :shared;

@FileList = &CreateFileList(@DirectoryList);

my @ThreadList;

undef @ThreadList;
while ($#ThreadList lt ($ThreadCount - 1))
{
	@ThreadList = (@ThreadList, threads->create('StripFile'));
}

# Wait for all threads to exit.
# Each thread will exit when it finds that @FileList is empty.
while ($#ThreadList ge 0)
{
	my $ThreadJoin;
	($ThreadJoin, @ThreadList) = @ThreadList;
	$ThreadJoin->join();
}

sub processFile {
	my $file = shift;

	eval {
		print "$file... " if $VERBOSE;
		my $output = defined $OUTPUT ? $OUTPUT : $file;
		my $src = do {
			open my $fh, "<:perlio", $file
				or die "$file: $!\n";
			local $/;
			<$fh>
		};
		printf "%d ", length $src if $VERBOSE;
		$src = (new Perl::Strip @cache, optimise_size => $OPTIMISE_SIZE)->strip ($src);
		printf "to %d bytes... ", length $src if $VERBOSE;
		print $output eq $file ? "writing... " : "saving as $output... " if $VERBOSE;
		open my $fh, ">:perlio", "$output~"
			or die "$output~: $!\n";
		length $src == syswrite $fh, $src
			or die "$output~: $!\n";
		close $fh;
		rename "$output~", $output;
		print "ok\n" if $VERBOSE;
	};

	if ($@) {
		print STDERR "$@\n";
		exit 2;
	}
}

sub StripFile
{
	while ($#FileList ge 0)
	{
		my $FileName;
		{
			lock($FileListLock);
			$FileName="";
			if ($#FileList ge 0)
			{
				($FileName, @FileList) = @FileList;
			}
		}
		if ($FileName ne "")
		{

			processFile($FileName);
	
		}
	}
	threads->exit();
}

sub CreateFileList
{
	my @DirectoryList = @_;
	
	my @FileList; undef @FileList;

	my $DirectoryName;
	my @NodeList;
	my $NodeName;
	my $PathName;

	if (defined $CACHEDIR) {
		@cache = (cache => $CACHEDIR);
	} elsif ($CACHE) {
		mkdir "$ENV{HOME}/.cache";
		@cache = (cache => "$ENV{HOME}/.cache/perlstrip");
	}

	while (@DirectoryList)
	{
		$DirectoryName = shift(@DirectoryList);

		opendir(DIR, "$DirectoryName");
		@NodeList = readdir(DIR);
		@NodeList = sort @NodeList;
		closedir(DIR);

		foreach $NodeName (@NodeList)
		{
			$PathName = "$DirectoryName/$NodeName";
			if ($NodeName ne "." && 
			    $NodeName ne "..")
			{
				if (-d $PathName)
				{
					push @DirectoryList, $PathName;
					next;
				}
				else
				{
					if ($NodeName =~ /\.al$/i ||
					    $NodeName =~ /\.ix$/i ||
					    $NodeName =~ /\.pl$/i ||
					    $NodeName =~ /\.pm$/i )
					{
						@FileList = (@FileList, $PathName);
					}
				}
			}
		}
	}
	@FileList = sort @FileList;
	return @FileList;
}
