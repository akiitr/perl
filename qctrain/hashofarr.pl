use strict;
use warnings;
use Data::Dumper;

$\ = "\n";
my %container;

open FH, '< data.txt' or die $!;

while(my $line = <FH>) {
	chomp $line;
	my ($login, @temp) = split ':', $line; #list assignment
	$container{$login} = \@temp;
}
close FH;

#print Dumper %container;

print "Iterating the key value pair";

while (my ($user, $userinfo) = each %container) {
	print $user;
	
	foreach my $item (@$userinfo) {
		print "\t$item";
	}
	print '';
}

