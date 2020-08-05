use strict;
use warnings;

$\ = "\n";

my $s = "The python and the perl scripting";

# =~ bind operator
# Anything between the m/../ is a regex pattern assigned bind to variable s
# i = for ignoring the case
# ? at last word to non greedy match of the word as encounter the word stop.
# pattern ($s =~ m/P.+?N/i) : python
# pattern ($s =~ m/P.+N/i) : python and the perl scriptin

if ($s =~ m/P.+?N/i) {
	print "MATCH!!";
	print "Matched string: $&";
} else {
	print "FAILED";
}

# "Matching multiple times with g as global modifier to match multiple times"
print "Matching multiple times with g as global modifier to match multiple times";
while ($s =~ m/P.+?N/ig)  {
	print "matched string: $&";
}

