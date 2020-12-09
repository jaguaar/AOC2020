#!/usr/bin/perl
use strict;

open my $FILE, "chal9Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my $number = 552655238;

my $min = 0;
my $max = 0;

foreach my $x (0..$#input) {
	my $count = $input[$x];
	
	foreach my $y ($x+1..$#input) {
		$count += $input[$y];
		
		if($count == $number) {
			$min = $x;
			$max = $y;
			
			print (($x+1) . " <=> " . ($y+1) . "\n");
		}
	}
}

my $minValue = 99999999999999999;
my $maxValue = 0;

foreach my $x ($min..$max) {
	my $cur = $input[$x];
	
	if($minValue > $cur) {
		$minValue = $cur;
	}
	
	if($maxValue < $cur) {
		$maxValue = $cur;
	}
}

print "$minValue <=> $maxValue\n";