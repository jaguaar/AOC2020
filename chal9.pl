#!/usr/bin/perl
use strict;

open my $FILE, "chal9Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my $preamble = 25;
my $index = $preamble;

while( $index < $#input) {
	my $number = $input[$index];
	
	my $found = 0;
	
	#print "Ima loop: " . ($index-$preamble) . " to " . ($index-1) . "\n";
	
	foreach my $x (($index-$preamble)..($index-1)) {
		foreach my $y (($index-$preamble)..($index-1)) {
			#print "Trying for $number: " . $input[$x]. "+" . ($input[$y]) . "\n";
		
			if($number == (($input[$x]) + ($input[$y]))) {
				$found = 1;
			}
		}
	}
	
	if(!$found) {
		print $number . " failed\n";
	}
	
	$index++;
}