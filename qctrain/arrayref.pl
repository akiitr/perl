use strict;
use warnings;

$\ = "\n";

my @items = (11, 22, 33);
print "my array elements are: @items";

print 'Below is the refrence for the array';
print \@items;

my $pointer = \@items;
print 'Below is the refrence when assigned to variable $pointer';
print $pointer;

print 'Below is the derefrencing first element using $pointer->[1]';
print $pointer->[1];

$pointer->[2] *= 0.5;
print 'Updating the value of 3rd element using $pointer-> *= 0.5';
print "updated array is: @items";

print 'adding an element in array using push @$pointer, \'vlaue\'';
push @$pointer, 'qualcomm';
shift @$pointer;
print "updated array is: @items";
