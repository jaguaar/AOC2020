#!/usr/bin/perl
use strict;

open my $FILE, "chal5Input.txt" or die $!;
my @input = <$FILE>;
close $FILE;

my @sanitizedData;

my $buffer = "";

foreach my $line (@input) {
	$buffer .= $line if($line ne "\n");

	if($line eq "\n") {
		push(@sanitizedData, $buffer);
		$buffer = "";
	}
}
push(@sanitizedData, $buffer);
