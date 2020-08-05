use strict;
use warnings;

my $pattern = 'bash$'; # For match ending with bash
$pattern = '^r'; # For match starting with r

open FH, '< passwd.txt' or die $!;

# m in matching binding is not required in perl

while (my $line = <FH>) {
	if ($line =~ /$pattern/i) {
		print $line;
	}
}

close FH;

