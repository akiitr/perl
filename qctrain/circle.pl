#!/usr/bin/perl perl
#File: greet.pl

use strict; # To follow strict perl guidelines or methodology
use warnings; #raise the warnings for the errors

print "enter the radius of the circle";
my $rad = <STDIN>; #stream reader
chomp ($rad); # removes the input record seperator which is by default new-line
my $org = 22/7 * $rad ** 2;


print "rad: $rad";
print "Area : $org";

$\ = "\n"; #output record seperator

print "\nrad: $rad";
print "Area : $org";
printf "Given radius : %s\narea : %.3f\n", $rad, $org; #use printf for fomatted input
