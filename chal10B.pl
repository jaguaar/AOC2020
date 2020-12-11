#!/usr/bin/perl
use strict;

$| = 1;

open my $FILE, "chal10Input.txt" or die $!;
chomp(our @input = <$FILE>);
close $FILE;

my $jolt = 0;
my $currentAdapter = 1;

my @possiblePaths;
our @currentPath = (0);

our %finalSolutionPathing;

our $pathCount = 0;

foreach my $path (@currentPath) {
	whatever($path);
}

print "Final Paths is $pathCount\n";

sub whatever() {
	my $jolt = shift;
	
	#print "[+] Working with $jolt\n";
	
	while (1) {
		my @possibleAdapters = findAdaptersForJolt($jolt, @input);
		
		if($#possibleAdapters > 0) {			
			foreach my $curAdapter (@possibleAdapters) {
				#print "$curAdapter for $jolt\n";				
				push @currentPath, $curAdapter;
			}
			
			return;
		}
		
		if($#possibleAdapters == 0) {
			$jolt = $possibleAdapters[0];			
		}
		
		if($#possibleAdapters == -1) {
			$pathCount++;
			return;
		}
	}
}

sub findAdaptersForJolt() {
	my $jolt = shift;
	my @input = @_;
	
	my @possibleAdapters;
	
	foreach my $adapter (@input) {
		if($adapter < $jolt + 4 && $adapter > $jolt) {
			push @possibleAdapters, $adapter;
		}
	}
	
	return @possibleAdapters;
}