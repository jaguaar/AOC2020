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

my @searchForTheseBags = ("shiny gold");

my %uniqueBags;

foreach my $bagName (@searchForTheseBags) {
	foreach my $key (keys %data) {
		if($data{$key} =~ /^.+?$bagName.+?$/) {			
			$uniqueBags{$key} = 1;
			push @searchForTheseBags, $key;
		}
	}
}

foreach my $key (%uniqueBags) {
	print $1 . "\n"	if($key =~ /^(.+) bag(s?)$/);
}


my $count = keys %uniqueBags;

print "Final: $count";