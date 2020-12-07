#!/usr/bin/perl
use strict;

open my $FILE, "chal7Input.txt" or die $!;
my @input = <$FILE>;
close $FILE;

my %data;

foreach my $line (@input) {
	if($line =~ /^(.+) bags contain (.+)$/) {
		$data{$1} = $2;
	} else {
		die "Wtf, $line";
	}
}

print howmanyBagsInThisBag("shiny gold", %data);

sub howmanyBagsInThisBag() {
	my $color = shift;
	my %data = @_;
	
	my $tc = 0;
	
	foreach my $key (keys %data) {		
		if($key =~ /^$color/) {	
			print "Found $key in " . $data{$key} . "\n";
			
			my @dataset = split(/, /,$data{$key});
			
			my $bagCount = 0;
						
			foreach my $result (@dataset) {	
				if($result =~ /^(\d) (.+)$/) {
					my $amountOfBags = $1;
					my $newBagName = $2;
				
					$newBagName =~ s/ bags?\.?$//;
					
					$bagCount += $amountOfBags + ($amountOfBags * howmanyBagsInThisBag($newBagName, %data));
				}
			}
			
			$tc += $bagCount;
		}
	}
	
	return $tc;
}