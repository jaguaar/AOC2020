#!/usr/bin/perl -w
use strict;

open (my $FILE, "chal1Input.txt") or die $!;
chomp(my @input = <$FILE>);
close $FILE;

foreach my $number (@input) {
	foreach my $number2 (@input) {
		if($number > $number2) {
			my $result = $number+$number2;
			
			if($result == 2020) {
				print "$number + $number2 = $result\n" ;
				print "Answer is " . ($number*$number2) . "\n";
			}
		}
	}
}
