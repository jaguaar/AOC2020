#!/usr/bin/perl
use strict;
use List::Util qw(max);

my $rowLow = 0;
my $rowHigh = 127;

my $columnLow = 0;
my $columnHigh = 7;

open my $FILE, "chal5Input.txt" or die $!;
chomp(my @fileContent = <$FILE>);
close $FILE;

my @seatIds;

foreach my $input (@fileContent) {
	if($input =~ /([B,F]{7})([L,R]{3})/) {
		my $rowInput = $1;
		my $columnInput = $2;
		
		my $row = calculate($rowLow, $rowHigh, $rowInput);
		my $column = calculate($columnLow, $columnHigh, $columnInput);
		
		push(@seatIds, (($row*8)+$column));
	} else {
		die "WTF?";
	}
}

print max(@seatIds);

sub calculate() {
	my $low = shift;
	my $high = shift;
	my $input = shift;

	my @data = split(//, $input);	
	foreach my $letter (@data) {
		my $difference = $high - $low;
			
			
		my $split;
		
		if(($difference % 2) != 0) {
			$difference -= 1;
			
			$split = $difference /2;
			
			$split++;
		} else {
			$split = $difference / 2;
		}
		
		if($letter eq "F" || $letter eq "L") {
			$high -= $split;
		}
		
		if($letter eq "B" || $letter eq "R") {
			$low += $split;
		}
	}
	
	return $low;
}