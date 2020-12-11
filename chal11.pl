#!/usr/bin/perl
use strict;

open my $FILE, "chal11Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;


my @data;

foreach my $line (@input) {
	my @explodedLine = split(//, $line);
	
	push @data,\@explodedLine;
}

calculatePlayboard(@data);

sub calculatePlayboard() {
	my @data = @_;

	my $x = 0;

	my @secondData;

	foreach ($x .. $#data) {
		my @line = @{$data[$x]};
		
		my $y = 0;
		
		foreach ($y .. $#line) {
			my $singleChar = $line[$y];
			
			if($singleChar eq ".") {
				$secondData[$x][$y] = ".";
			} elsif ($singleChar eq "#") {
				my $adjacentOccupiedCount = calculateAdjacentOccupiedCount($x,$y,@data);
						
				if($adjacentOccupiedCount >= 4) {
					$secondData[$x][$y] = "L";
				} else {
					$secondData[$x][$y] = "#";
				}
			} elsif ($singleChar eq "L") {
				my $adjacentOccupiedCount = calculateAdjacentOccupiedCount($x,$y,@data);
						
				
				if($adjacentOccupiedCount == 0) {
					$secondData[$x][$y] = "#";
				} else {
					$secondData[$x][$y] = "L";
				}			
			}
			
			$y++;
		}
		
		$x++;
	}
	
	##Compare Boards

	$x = 0;

	my $again = 0;

	my $occupiedCount = 0;

	foreach ($x .. $#data) {
		my @line = @{$data[$x]};
		
		my $y = 0;
		
		foreach ($y .. $#line) {
			my $singleChar = $line[$y];
			if($singleChar ne $secondData[$x][$y]) {
				$again = 1;
			}
			
			if($singleChar eq "#") {
				$occupiedCount++;
			}
			
			$y++;
		}
		
		$x++;
	}

	if($again) {
		calculatePlayboard(@secondData);
	} else {
		foreach my $tmp (@secondData) {
			my @line = @{$tmp};
			foreach(@line) {
				print $_;
			}
			
			print "\n";
		}
		
		print "DONE OCCUPIED IS $occupiedCount";
	}
}

sub calculateAdjacentOccupiedCount() {
	my $x = shift;
	my $y = shift;
	my @data = @_;
	
	my $adjacentOccupiedCount = 0;
	
	if($x > 0) {
		if($y > 0) {
			$adjacentOccupiedCount++ if($data[$x-1][$y-1] eq "#");
		}
		
		$adjacentOccupiedCount++ if($data[$x-1][$y] eq "#");
		
		$adjacentOccupiedCount++ if($data[$x-1][$y+1] eq "#");
	}
	
	if($y > 0) {
		$adjacentOccupiedCount++ if($data[$x+1][$y-1] eq "#");
		$adjacentOccupiedCount++ if($data[$x][$y-1] eq "#");
	}
	
	$adjacentOccupiedCount++ if($data[$x+1][$y+1] eq "#");
	$adjacentOccupiedCount++ if($data[$x+1][$y] eq "#");
	$adjacentOccupiedCount++ if($data[$x][$y+1] eq "#");
	

	return $adjacentOccupiedCount;
}
