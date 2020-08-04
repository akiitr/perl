use strict;
use warnings;

#File mode <: Read, >:Write, >>:Append

open FH, 'cricket.txt' or die $!;
while (my $temp = <FH>) {
	print "$. $temp"; # $. is prints the record or line no
}
close FH;

