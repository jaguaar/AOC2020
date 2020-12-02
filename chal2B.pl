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
		my $pos1 = $1-1;
		my $pos2 = $2-1;
		my @password = split(//, $4);
	
		
		if (($password[$pos1] eq $letter && $password[$pos2] ne $letter) || ($password[$pos1] ne $letter && $password[$pos2] eq $letter)) {
			print "$letter : $pos1, $pos2 in @password\n";
			return 1;		
		}
	}
	
	return 0;
}