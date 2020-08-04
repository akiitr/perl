use strict;
use warnings;

my ($name, $age) = ('anu', 25);

$\ = "\n";

print 'I am $name, $age years old';
print "I am $name, $age years old";


# all upper -> uc first lower -> ucfirst

print uc $name;
print ucfirst $name;

# all lower -> lc first lower -> lcfirst

$name = uc $name;

print lc $name;
print lcfirst $name;

my $len = length $name;

print "The length of $name is $len";

