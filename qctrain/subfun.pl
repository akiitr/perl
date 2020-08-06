use strict;
use warnings;

$\ = "\n";

#handle the arguments
print '@_ is the default array which has the all passed arguments';
sub demo {
	print "@_"; #default array
}
sub power {
	my ($x, $n) = @_; #list arguments from default array
	return $x ** $n;
}
sub printc {
	my ($s, $width, $fill) = @_;
	my $items = int (($width - length $s) / 2);

	my $filler = $fill x $items;
	return $filler.$s.$filler;
}

print "Calling the demo function";
demo;
demo 1000;
demo 1, 2, 'iii', 3, 4;
my $result = power 4, 5;
print "power 4, 5 result in : $result";
print "printing in centre in word using printc subroutine:";
print printc 'perl', 80, '-';
print "Anubhav kumar";
print printc '~', 80, '~';
