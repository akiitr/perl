use strict;
use warnings;

my %wc;
open FH, '< cricket.txt' or die $!;

#$/ = "\ ";
$\ = "\n";

while ( my $temp = <FH>) {
	foreach my $word (split ' ', $temp) {
		$word =~ s/[.,]//;

		if (exists $wc{$word}) {
			$wc{$word}++;
		} else {
			$wc{$word} = 1;
		}
	}
}

close FH;

# Sorting the values with the respect to the values
# for which we use the manual comparison with {$wc{$b} <=> $wc{$a}} for descending 

foreach my $word (sort {$wc{$b} <=> $wc{$a}} keys %wc) {
	print $word, ' : ', $wc{$word};
}
