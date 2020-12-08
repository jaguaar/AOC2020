#!/usr/bin/perl
use strict;

open my $FILE, "chal8Input.txt" or die $!;
chomp(my @realInput = <$FILE>);
close $FILE;

my @input = @realInput;

print "Content is " . @input . "\n";
tryInstructions(@input);

my @input = @realInput;

my $index = 0;

while ($index < $#input) {
	print "run $index\n";
	print "Content is " . @input . "\n";
	
	$input[$index] =~ s/jmp/nop/;
	$input[$index] =~ s/acc/nop/;
	
	tryInstructions(@input);
	
	$index++;
	@input = @realInput;
}


sub tryInstructions() {
	my @input = @_;
	my $accumulator = 0;

	my $index = 0;

	while($input[$index] ne "DONE" && $index < $#input) {
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

	if($input[$index] eq "DONE") {
		print "Infinite Loop\n";
		return;
	}

	die $accumulator;
}