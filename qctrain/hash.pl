use strict;
use warnings;

#Hash = Dictionary

my %info = (
	host => 'wsl',
	domain => 'rootcap.in',
	desc => 'apached_httpd',
	app => 'apache_httpd',
	version => 2.2
);

$\ = "\n";
print %info;

# Adding an element in HASH
print "adding arch key as x86_64";
$info {arch} = 'x86_64'; #scalar representation of the hash
$info {release}  = 'green-parrot';
print %info;

# updating an element in HASH
print "updating version value as 3.6";
$info {version} = 3.6; #scalar representation of the hash
print %info;

# Delete an element in HASH
print "delete arch key as x86_64";
delete $info {arch}; #scalar representation of the hash
print %info;

# Looking up an element in HASH
print "looking up for version";
print "The version key value is: $info{version}";

# Looking for the keys and vlaues of the hash
print "Below are the keys: ";
print keys %info;

print "Below are the values: ";
print values %info;

# Iterate an hash

foreach my $key (keys %info) {
	print "The key $key has value: $info{$key}";
}

# Updating an array in the hash

my @items = ('lang', 'perl', 'author', 'larry', 'version', '5.2');
my %hash = @items;
print " Hash from an array @items updated in hash updating the keys ....";
foreach my $key (keys %hash) {
	print "The key $key has value: $hash{$key}";
}
