use strict;
use warnings;

$\ = "\n";

my $s = 'root:x:0:0:root:/root:bin/bash';

my @items = split ':', $s;
print "@items";
print '';

#iterating the array

foreach my $item (@items) {
	print $item;
}

