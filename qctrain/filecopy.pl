use strict;
use warnings;

if (@ARGV != 2) {
	print "usage:\n";
	print "$0 src-file dest-file";
	exit;
}

open FH, '<', $ARGV[0] or die $!;
open FW, '>', $ARGV[1] or die $!;

print FW <FH>;

close FW;
close FH;
