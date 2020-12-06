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
	
	my @groupMemberAnswers = split/\n/, $groupData;
	
	foreach my $groupMemberAnswer (@groupMemberAnswers) {
		foreach my $singleAnswer (split(//, $groupMemberAnswer)) {
			if($singleAnswer =~ /^[a-zA-Z]$/) {
				$uniqueAnswers{$singleAnswer}++;
			}
		}
	}
	
	foreach my $key (keys %uniqueAnswers) {
		if($uniqueAnswers{$key} == ($#groupMemberAnswers+1)) {
			$totalUniqueSum ++;
		}
	}
}

print $totalUniqueSum;