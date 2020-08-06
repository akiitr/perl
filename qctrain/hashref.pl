use strict;
use warnings;
use Data::Dumper;

my %items = (lang => 'perl', author => 'wall', version => 2.2);

$\ = "\n";

print 'hash refrence using \%items';
print \%items;

my $ref = \%items;
print "using variable ref : $ref";
print "Dumping data using Dumper hash values are:";
print Dumper $ref;

print 'adding an element using $ref->{release} = value and updating autor and deleting using delete $ref->{version}';
$ref->{release} = 'spherical cow';
$ref->{author} = 'larry wall';
delete $ref->{version};

# Iterating
foreach my $key (keys %$ref) {
	print $key, ' -> ', $ref->{$key};
}	

