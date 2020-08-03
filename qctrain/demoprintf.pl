

use strict;
use warnings;

my $i=0;

while ($i <= 15) {
	printf "|%8b||%8o||%8d||%8x|\n", $i, $i, $i ,$i;
	$i++;
}


