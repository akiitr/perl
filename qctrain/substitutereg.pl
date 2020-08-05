use strict;
use warnings;

my $x = 'root:x:0:0:root:/root:/bin/bash';

$\ = "\n";
$x =~ s/:/,/;
print "Subsitututed string: $x";
print "";

$x =~ s/:/,/g;
print "Substituted string globally with g in pattern: $x";
print "";

$x =~ s/[AEIOU]/*/gi;
print "Substituted vowel globally ignoring case with gi in pattern: $x";
print "";
