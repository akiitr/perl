use strict;
use warnings;

#File mode <: Read, >:Write, >>:Append

open FH, 'passwd.txt' or die $!;
my @user;

while (my $temp = <FH>) {
	my @arr = split ':', $temp;
	push @user, $arr[0];
}

$\ = "\n";
@user = sort @user;
print "The sorted user-name from passwd.txt are: @user";
close FH;

open FW, '> user.dat' or die $!;

foreach my $name  (@user) {
	print $name;
	print FW $name;
}
close FW;

