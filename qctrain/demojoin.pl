use strict;
use warnings;

my @items = ('root', 'x', '0', '0', 'root', '/root', 'bin','/bash');

my $s = join ':', @items;

$\ = "\n";

print "The updated string from joining array @items is : $s";

