

use strict;
use warnings;

my $i =1 ;

$\ = "\n";

while ($i <= 10) {
	if ($i == 1) {
		print "one"}
	elsif ($i == 2) {
		print "ii"}
	elsif ($i <7 && $i >2) {
		$i++;
		next; } # similar to continue
	elsif ($i >= 7) {
		last; } # similar to break
	$i++;
}

