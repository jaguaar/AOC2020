#!/usr/bin/perl
use strict;

#############################################
#shift means it takes a command from the cli#
#############################################

open my $FILE, "chal3Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my @data;

foreach my $line (@input) {
	my @explodedLine = split(//, $line);
	push @data, \@explodedLine;
}

my $column = 0;
my $columnIncreaser = shift;
my $row = 0;
my $rowIncreaser = shift;

my $trees = 0;
my $open = 0;

my $rowWidth = $#{ $data[0] };

while($column < $#data) {
	$column += $columnIncreaser;
	$row += $rowIncreaser;
	
	if($row > $rowWidth) {
		$row -= ($rowWidth + 1);
	}
	
	my $positionContent = @{ $data[$column] }[$row];
	#print "$column , $row, $positionContent\n";
	
	$open++ if($positionContent eq ".");
	$trees++ if($positionContent eq "#");
}

print "Open: $open ;; Trees: $trees\n";