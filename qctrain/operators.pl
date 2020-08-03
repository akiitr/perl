

use strict;
use warnings;

# ternary operator
#syntax
# test-condition? true : false

my $n = 4;

my $result = $n > 5 ? $n**2 : $n**3;
$\ = "\n"; # will not work with the single quote '

print "$n > 5 ? $n**2 : $n**3";
print $result;

