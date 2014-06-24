#!/usr/bin/perl

use threads;
use threads::shared;

use Perl::Tidy;

my $ThreadCount;
my @DirectoryList;

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
			my $FileNameOld = $FileName;
			my $FileNameNew = $FileName . "~";
			my $Argv = "-i=0 -ce -l=1024 -nbl -pt=2 -bt=2 -sbt=2 -bbt=2 -bvt=1 -sbvt=2 -pvtc=1 -lp -cti=0 -ci=0 -bar -bol  -dac -dbc -dsc -dp";

			unlink $FileNameNew;

			perltidy(source => $FileNameOld, destination => $FileNameNew, argv => $Argv);
	
			rename ($FileNameNew, $FileNameOld);
			unlink $FileNameNew;
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
