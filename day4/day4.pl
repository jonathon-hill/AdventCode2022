#!/usr/bin/perl

use strict;
use warnings;

$\ = "\n";

open(FH, '<', "day4_input.dat") or die $!;

my $containsCount = 0;
my $overlapsCount = 0;
while(<FH>) {
    chomp;
    my @sections = split(/[\-,]+/, $_); 

    if (contains([@sections[0,1]], [@sections[2,3]])) {
	$containsCount++;
    }

    if (overlaps([@sections[0,1]], [@sections[2,3]])) {
	$overlapsCount++;
    }
}
close(FH);
print $containsCount;
print $overlapsCount;

sub contains {
    my ($left, $right) = @_;
    my $diff1 = $left->[0] - $right->[0];
    my $diff2 = $left->[1] - $right->[1];


    if (($diff1 >= 0 && $diff2 <= 0) || ($diff1 <= 0 &&  $diff2 >= 0)) {
	return 1;
    }

    return 0;
}

sub overlaps {
    my ($left, $right) = @_;
    my $diff1 = $left->[0] - $right->[1];
    my $diff2 = $left->[1] - $right->[0];

    if (($diff1 >= 0 && $diff2 <= 0) || ($diff1 <= 0 &&  $diff2 >= 0)) {
	return 1;
    }

    return 0;
}
