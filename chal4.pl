#!/usr/bin/perl
use strict;

open my $FILE, "chal4Input.txt" or die $!;
my @input = <$FILE>;
close $FILE;

my @sanitizedData;

my @passportValidators = ("byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid");

my $buffer = "";
my $validCounter = 0;

foreach my $line (@input) {
	$buffer .= $line if($line ne "\n");

	if($line eq "\n") {
		push(@sanitizedData, $buffer);
		$buffer = "";
	}
}
push(@sanitizedData, $buffer);

foreach my $line (@sanitizedData) {
	my $valid = 1;
	
	foreach my $validator (@passportValidators) {
		if($line !~ /\Q$validator\E/) {
			$valid = 0;
		}
	}
	
	$validCounter++ if($valid);
}

print $validCounter;