

use strict;
use warnings;

my $i = int(rand(10));

$\ = "\n";
print "Hey! Welcome to the guessing game v1.0";
print "The no is btw 1-10 and you have 5 chances";

my $chance = 1;
print "";
print "Enter the no: \n";
my $user = <STDIN>;
chomp $user;
print "The no is $i";
while($chance <=5) {
	if ($user > $i) {
		print (" guess lower!!");
		print "Enter the no: ";
		$user =  <STDIN>;
		chomp $user;}
	elsif ($user < $i) {
		print (" guess higher!!");
		print "Enter the no";
		$user  = <STDIN>;
		chomp $user; }
	elsif ($user == $i) {
		print ("Yay!! You guessed right in $chance attempt");
		exit 1;}

	print "Chance:";
	print $chance++;
	print "";
}

