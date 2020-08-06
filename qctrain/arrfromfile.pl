use strict;
use warnings;
use Data::Dumper;

$\ = "\n";
my @content;

open FH, '< data.txt' or die $!;

while (my $line = <FH>) {
	chomp $line;
	my @temp = split ':', $line;
	push @content, \@temp;
}

close FH;

print Dumper @content;

# adding header for the columns
my @header = ('login', 'password', 'uid', 'gid', 'gecos', 'home', 'shell');

print "Printing the array with the column names and sorting by the uids in ascending order";

foreach my $userinfo (sort{$a->[2] <=> $b->[2]} (@content)) {
	my $index = 0;

	foreach my $items (@$userinfo) {
		printf "%10s : %s\n", $header[$index++], $items;
	}
	print "";
}
