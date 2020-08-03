

use strict;
use warnings;

print 'enter the directory path you want to check the content of';
my $path = <STDIN>;
chomp $ path;

if (! -d $path) {
	print "$0: directoy not found: $path"; # $0 - first argument passed
	exit 1;
}

opendir DH, $path;

$\ = "\n"; # For introducing the new line after every print

while (my $item = readdir DH) {
	print $item;
}

close DH;

