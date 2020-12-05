#!/usr/bin/perl
use strict;

open my $FILE, "chal4Input.txt" or die $!;
my @input = <$FILE>;
close $FILE;

my @sanitizedData;

my $buffer = "";
my $validCounter = 0;

my @eyeColors =  ("amb", "blu", "brn", "gry", "grn", "hzl", "oth");

foreach my $line (@input) {
	$buffer .= $line if($line ne "\n");

	if($line eq "\n") {
		push(@sanitizedData, $buffer);
		$buffer = "";
	}
}
push(@sanitizedData, $buffer);

print "\n\n";

foreach my $line (@sanitizedData) {
	my $valid = 1;
	
	my %passportValidators = (
		"byr" => "",
		"iyr" => "",
		"eyr" => "",
		"hgt" => "",
		"hcl" => "",
		"ecl" => "",
		"pid" => ""
	);
	
#	print "Working on line $line\n\n";
	
	if($line =~ /byr:(\d{4})/ && $1 >= 1920 && $1 <= 2002) {
		$passportValidators{"byr"} = $1;
#		print "BYR is $1\n";
	}
	
	if($line =~ /iyr:(\d{4})/ && $1 >= 2010 && $1 <= 2020) {
		$passportValidators{"iyr"} = $1;
#		print "IYR is $1\n";
	}
	
	if($line =~ /eyr:(\d{4})/ && $1 >= 2020 && $1 <= 2030) {
		$passportValidators{"eyr"} = $1;
#		print "EYR is $1\n";
	}
	
	if($line =~ /hgt:(\d{3})cm/ && $1 >= 150 && $1 <= 193) {
		$passportValidators{"hgt"} = $1;
#		print "HGT is $1\n";
	}
	
	if($line =~ /hgt:(\d{2})in/ && $1 >= 59 && $1 <= 76) {
		$passportValidators{"hgt"} = $1;
#		print "HGT is $1\n";
	}
	
	if($line =~ /hcl:\#([a-f0-9]{6})/) {
		$passportValidators{"hcl"} = $1;
#		print "HCL is $1\n";
	}
	
	if($line =~ /ecl:([a-z]{3})/ && ($1 ~~ @eyeColors)) {
		$passportValidators{"ecl"} = $1;
#		print "ECL is $1\n";
	}
	
	if($line =~ /pid:(\d{9})/) {
		$passportValidators{"pid"} = $1;
#		print "PID is $1\n";
	}
	
	foreach my $validator (keys  %passportValidators) {
		if($valid && $passportValidators{$validator} eq "") {
			$valid = 0;
		}
	}
	
	if($valid) {
		$validCounter++;
		
		#print "Line: $line\n\n";
	}
}

print "$validCounter \n";