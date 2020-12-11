#!/usr/bin/perl
use strict;

open my $FILE, "chal10Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my $jolt = 0;
my $currentAdapter = 1;

my $oneDifCount = 0;
my $twoDifCount = 0;
my $threeDifCount = 1;

while ($currentAdapter != 99999) {
	$currentAdapter = findAdapterForJolt($jolt, @input);
	
	if($currentAdapter == 99999) {
		print "$oneDifCount <=> $twoDifCount <=> $threeDifCount\n";
		exit;
	}
	
	print "[+] Found $currentAdapter\n";
	
	if($currentAdapter == ($jolt+1)) {
		print "oneDifCount $currentAdapter && $jolt +1\n";
		$oneDifCount++;
	} elsif ($currentAdapter == ($jolt+2)) {
		print "twoDifCount $currentAdapter && $jolt +2\n";

		$twoDifCount++;
	} elsif($currentAdapter == ($jolt+3)) {
		print "threeDifCount $currentAdapter && $jolt +3\n";
		$threeDifCount++;
	} else {
		die "Something went wrong...";
	}
	
	$jolt = $currentAdapter;
}


sub findAdapterForJolt() {
	my $jolt = shift;
	my @input = @_;
	
	my $lowestPossibleAdapter = 99999;
	
	foreach my $adapter (@input) {
		if($adapter < $jolt + 4 && $adapter > $jolt && $adapter < $lowestPossibleAdapter) {
			$lowestPossibleAdapter = $adapter;
		}
	}
	
	return $lowestPossibleAdapter;
}