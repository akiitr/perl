use strict;
use warnings;

open FH, '< passwd.txt' or die $!;

while (my $line = <FH> ) {
	if ($. <= 10) {
		$line =~ s/:/,/g;
	}
	print $line;
}
close FH;

