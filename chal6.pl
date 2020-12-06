#!/usr/bin/perl
use strict;

open my $FILE, "chal6Input.txt" or die $!;
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

my $totalUniqueSum = 0;

foreach my $groupData (@sanitizedData) {
	my %uniqueAnswers;
	
	foreach my $singleAnswer (split(//, $groupData)) {
		if($singleAnswer =~ /^[a-zA-Z]$/) {
			$uniqueAnswers{$singleAnswer} = 1;
		}
	}
	
	my $answers = keys %uniqueAnswers;
	
	$totalUniqueSum += $answers;
}

print $totalUniqueSum;