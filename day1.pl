#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw/sum/;

$\ = "\n";

my $file = "day1_input.dat";
open(FH, '<', $file) or die $!;

my @calories = (0);
while (<FH>) {
    chomp;
    if ($_ eq '') {
	push @calories, 0;
    } else {
	$calories[-1] += $_;
    }
}
close(FH);

@calories = sort{$b <=> $a} @calories;
print $calories[0];
print sum(@calories[0..2]);
