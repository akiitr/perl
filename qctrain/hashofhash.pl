use strict;
use warnings;
use Data::Dumper;

$\ = "\n";
my %content;
my @keys = ('password', 'uid', 'gid', 'gecos', 'home', 'shell');

open FH, '< passwd.txt' or die $!;

while(my $line = <FH>) {
	chomp $line;
	my ($login, @userinfo) = split ':', $line;
	my %temp;

	foreach my $key (@keys) {
		$temp{$key} = shift @userinfo;
	}

	$content{$login} = \%temp;
}

close FH;

# print Dumper %content;

foreach my $user (sort keys %content) {
	print $user;
	while (my ($key, $value) = each %{$content{$user}}) {
		print "\t$key : $value";
	}
	print '';
}
