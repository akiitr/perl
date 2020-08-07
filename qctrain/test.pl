use strict;
use warnings;

my $a =3;
print foo2();

sub foo {
	my $a = $a;
}
BEGIN {
	print 'a';
}
END { 
	print 'b';
}
BEGIN {
	print 'c';
}
END {
	print 'd';
}
$a = 3;
print ref($a);

sub foo2 {
	wantarray ? 'list' : 'b';
}
