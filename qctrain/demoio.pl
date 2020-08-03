#!/usr/bin/perl perl
#File: greet.pl

use strict; # To follow strict perl guidelines or methodology
use warnings; #raise the warnings for the errors

print "enter the Name";
my $name = <STDIN>; #stream reader
chomp ($name, $name); # removes the input record seperator which is by default new-line
my $org = 'Qualcomm';

print "Name: $name";
print "Organinzation: $org";

$\ = "\n"; #output record seperator

print "\nName: $name";
print "Organinzation: $org";

