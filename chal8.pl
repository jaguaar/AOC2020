#!/usr/bin/perl
use strict;

open my $FILE, "chal8Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my $accumulator = 0;

my $index = 0;

while($input[$index] ne "DONE") {
	my $newIndex = $index;
	
	if($input[$index] =~ /^acc ([\+\-])(.+)$/) {
		if($1 eq "+") {
			$accumulator += $2;
		} else {
			$accumulator -= $2;
		}
	}
	
	if($input[$index] =~ /^jmp ([\+\-])(.+)$/) {
		if($1 eq "+") {
			$newIndex += $2;
		} else {
			$newIndex -= $2;
		}
	} else {
		$newIndex++;
	}
	
	$input[$index] = "DONE";
	$index = $newIndex;
}

print $accumulator;