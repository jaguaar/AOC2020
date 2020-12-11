#!/usr/bin/perl
use strict;
use File::Slurp;

$| = 1;

###SHAMELESSLY STOLEN###

my @lines = read_file('chal10Input.txt');
@lines = sort {$a <=> $b} @lines;
@lines = map { chomp $_; $_ } sort {$a <=> $b} @lines;
push @lines, $lines[-1] + 3;

my %routes = (0 => 1);

foreach my $i (@lines) {
    $routes{$i} = $routes{$i-1} + $routes{$i-2} + $routes{$i-3};
    print "$i: $routes{$i}\n";
}