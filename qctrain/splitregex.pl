use strict;
use warnings;

my $s = 'root:c,0;0:root,/root;/bin/bash'; # Case of hetrogeneous delimter

my @items = split /[:,;]/, $s;

$\ = "\n";

print "@items";
print "";

foreach my $item (@items) {
	print $item;
}

