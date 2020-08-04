use strict;
use warnings;

# File mode <: Read, >:Write, >>:Append
# $! error message is assigned to that variable and die print it when file does not exist

open FH, 'passwd.txt' or die $!;
while (my $temp = <FH>) {
	print "$. $temp"; # $. is prints the record or line no
}
close FH;

