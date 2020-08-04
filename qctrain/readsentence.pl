use strict;
use warnings;

#File mode <: Read, >:Write, >>:Append

open FH, 'cricket.txt' or die $!;
# Change the value to the input record seperator

$/ = "\."; #Input Record Seperator
$\ = "\n";

while (my $temp = <FH>) {
	print "$. $temp"; # $. is prints the record or line no
}
close FH;

