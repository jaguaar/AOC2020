#!/usr/bin/perl
use strict;

open my $FILE, "chal2Input.txt" or die $!;
chomp(my @input = <$FILE>);
close $FILE;

my $totalCorrect = 0;

foreach my $line (@input) {
	$totalCorrect += verifyPassword($line);
}

print "Result: $totalCorrect";

sub verifyPassword() {
	my $line = shift;

	if($line =~ /^(\d+?)\-(\d+?) (.)\: (.+)$/) {
		my $letter = $3;
		my $minOccurence = $1;
		my $maxOccurence = $2;
		my $password = $4;
		
		my $counter = () = $password =~ /\Q$letter/g;
		
		print "$counter\t$letter : $minOccurence, $maxOccurence in $password\n" if ( $counter >= $minOccurence && $counter <= $maxOccurence);
		return 1 if ( $counter >= $minOccurence && $counter <= $maxOccurence);
	}
	
	return 0;
}