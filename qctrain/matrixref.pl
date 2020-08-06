use strict;
use warnings;
use Data::Dumper;

$\ = "\n";

my @r1 = (1, 2, 3);
my @r2 = (4, 5, 6);
my @r3 = (7, 8, 9);

my @mat = (@r1, @r2, @r3);

print "The updated matrix from r1:@r1 r2:@r2 r3:@r3 @mat is:  @mat  and leghth is:";
print scalar @mat;

print "list of list is possible only using array of refrences";

@mat = (\@r1, \@r2, \@r3);
print 'The array mat using refrences @mat = (\@r1, \@r2, \@r3) is printed using Dumper module from data:';
print Dumper @mat;

print 'Updating the matrix array 2nd row 2nd col using $mat[1]->[1] = value updated array is:';
$mat[1]->[1] = 'x';
print Dumper @mat;

print 'Derefrencing the complete 3rd column using @{$mat[2]} column';
print @{$mat[2]};

print 'appending an element using push in second row @{$mat[2]}, 10';
push @{$mat[2]}, 10;

print 'deleting poping the last element of the first row from array using pop@{$mat[0]} updated array is:';
pop @{$mat[0]};
print Dumper @mat;

print "looping the array as dumper is for debugging";
foreach my $row (@mat) {
	foreach my $col (@$row) {
		print "$col\t";
	}
	print "\n";
}

