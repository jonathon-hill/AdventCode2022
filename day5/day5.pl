#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;

$\ = "\n";

my @stacks = ([],[],[],[],[],[],[],[],[]);
my @stacks2 = ([],[],[],[],[],[],[],[],[]);

while (<DATA>) {
    chomp;
    last if $_ eq "";
    next if ($_ =~ m/(\d\s+)+/);
	
    my @chars;
    push @chars, substr($_, 0, 4, "") while length $_;
    s/\s*\[*\]*//g for @chars; # Remove spaces and brackets
    
    for my $i (0..$#chars) {
	next if $chars[$i] eq "";
	unshift @{$stacks[$i]}, $chars[$i];
	unshift @{$stacks2[$i]}, $chars[$i];
    }
}

while(<DATA>) {
    chomp;
    next if $_ eq "";

    my ($count, $from, $to) = grep(length, split(/\D+/));
    for (0..$count-1) {
	push @{$stacks[$to - 1]}, pop(@{$stacks[$from - 1]});
    }

    my @slice = splice(@{$stacks2[$from - 1]}, $#{$stacks2[$from - 1]} - $count+1);
    push @{$stacks2[$to - 1]}, @slice;
}

my $result = "";
for (@stacks) {
    $result = $result . $_->[$#{$_}];
}

print $result;

$result = "";
for (@stacks2) {
    $result = $result . $_->[$#{$_}];
}

print $result;

__DATA__
        [M]     [B]             [N]
[T]     [H]     [V] [Q]         [H]
[Q]     [N]     [H] [W] [T]     [Q]
[V]     [P] [F] [Q] [P] [C]     [R]
[C]     [D] [T] [N] [N] [L] [S] [J]
[D] [V] [W] [R] [M] [G] [R] [N] [D]
[S] [F] [Q] [Q] [F] [F] [F] [Z] [S]
[N] [M] [F] [D] [R] [C] [W] [T] [M]
 1   2   3   4   5   6   7   8   9 

move 1 from 8 to 7
move 1 from 2 to 7
move 6 from 9 to 8
move 1 from 9 to 1
move 1 from 9 to 1
move 3 from 3 to 6
move 3 from 3 to 9
move 1 from 9 to 2
move 5 from 7 to 9
move 9 from 1 to 6
move 3 from 4 to 9
move 2 from 9 to 2
move 1 from 4 to 2
move 1 from 3 to 9
move 8 from 9 to 4
move 14 from 6 to 7
move 1 from 3 to 2
move 5 from 4 to 2
move 5 from 5 to 7
move 4 from 2 to 1
move 2 from 4 to 9
move 1 from 4 to 3
move 3 from 5 to 7
move 1 from 8 to 6
move 2 from 8 to 7
move 2 from 1 to 2
move 1 from 9 to 7
move 2 from 1 to 3
move 5 from 6 to 5
move 4 from 5 to 7
move 3 from 8 to 4
move 20 from 7 to 1
move 11 from 7 to 5
move 1 from 6 to 9
move 3 from 9 to 2
move 12 from 1 to 9
move 2 from 8 to 3
move 4 from 2 to 8
move 8 from 2 to 1
move 4 from 8 to 9
move 1 from 2 to 5
move 12 from 9 to 7
move 4 from 4 to 9
move 4 from 9 to 5
move 13 from 5 to 4
move 4 from 4 to 7
move 1 from 7 to 9
move 2 from 9 to 5
move 9 from 1 to 2
move 1 from 8 to 3
move 5 from 4 to 2
move 1 from 3 to 6
move 7 from 2 to 8
move 6 from 1 to 6
move 6 from 8 to 7
move 6 from 2 to 1
move 3 from 9 to 3
move 7 from 3 to 7
move 4 from 4 to 9
move 1 from 8 to 9
move 1 from 3 to 9
move 1 from 2 to 4
move 1 from 9 to 6
move 5 from 1 to 9
move 1 from 4 to 9
move 2 from 9 to 1
move 8 from 6 to 7
move 4 from 9 to 7
move 2 from 5 to 2
move 2 from 1 to 9
move 14 from 7 to 4
move 22 from 7 to 2
move 2 from 7 to 4
move 3 from 7 to 5
move 9 from 4 to 7
move 6 from 2 to 4
move 8 from 4 to 3
move 14 from 2 to 9
move 2 from 3 to 9
move 3 from 2 to 9
move 4 from 4 to 2
move 1 from 4 to 5
move 1 from 1 to 4
move 5 from 7 to 8
move 1 from 1 to 3
move 4 from 5 to 2
move 6 from 3 to 9
move 1 from 3 to 4
move 4 from 8 to 9
move 2 from 4 to 6
move 4 from 5 to 3
move 1 from 7 to 6
move 1 from 8 to 5
move 3 from 3 to 1
move 33 from 9 to 5
move 5 from 2 to 1
move 1 from 3 to 5
move 1 from 7 to 6
move 18 from 5 to 1
move 1 from 2 to 8
move 6 from 5 to 4
move 1 from 8 to 7
move 2 from 4 to 1
move 4 from 1 to 2
move 19 from 1 to 2
move 4 from 6 to 8
move 4 from 1 to 8
move 14 from 2 to 9
move 5 from 2 to 4
move 1 from 8 to 2
move 8 from 2 to 5
move 5 from 8 to 4
move 4 from 9 to 7
move 1 from 8 to 1
move 16 from 5 to 4
move 15 from 4 to 5
move 1 from 9 to 5
move 5 from 7 to 6
move 2 from 7 to 6
move 1 from 1 to 9
move 7 from 6 to 7
move 1 from 8 to 5
move 1 from 1 to 9
move 12 from 5 to 7
move 7 from 5 to 9
move 12 from 7 to 2
move 1 from 7 to 4
move 7 from 4 to 7
move 2 from 9 to 4
move 5 from 4 to 9
move 8 from 2 to 3
move 4 from 2 to 4
move 9 from 4 to 8
move 6 from 3 to 5
move 8 from 7 to 3
move 1 from 4 to 3
move 7 from 8 to 9
move 4 from 5 to 4
move 6 from 3 to 1
move 4 from 3 to 4
move 1 from 3 to 6
move 6 from 4 to 9
move 1 from 6 to 5
move 17 from 9 to 4
move 3 from 7 to 3
move 1 from 7 to 9
move 2 from 5 to 3
move 2 from 1 to 3
move 2 from 8 to 9
move 1 from 5 to 1
move 14 from 4 to 5
move 2 from 3 to 2
move 1 from 7 to 6
move 10 from 9 to 4
move 12 from 9 to 4
move 9 from 4 to 5
move 1 from 2 to 9
move 13 from 5 to 9
move 2 from 5 to 1
move 1 from 2 to 9
move 3 from 4 to 2
move 12 from 4 to 7
move 8 from 5 to 7
move 1 from 1 to 9
move 1 from 6 to 4
move 1 from 5 to 4
move 1 from 4 to 8
move 5 from 3 to 4
move 10 from 9 to 6
move 3 from 6 to 2
move 7 from 6 to 5
move 6 from 5 to 4
move 1 from 8 to 5
move 1 from 1 to 4
move 2 from 7 to 2
move 5 from 4 to 9
move 2 from 5 to 8
move 1 from 1 to 3
move 2 from 1 to 7
move 6 from 7 to 9
move 9 from 9 to 8
move 1 from 1 to 3
move 4 from 2 to 7
move 11 from 7 to 3
move 11 from 8 to 6
move 7 from 3 to 1
move 4 from 7 to 2
move 3 from 2 to 9
move 8 from 1 to 5
move 2 from 7 to 5
move 2 from 2 to 9
move 2 from 3 to 9
move 11 from 4 to 7
move 7 from 9 to 5
move 6 from 6 to 5
move 2 from 2 to 9
move 1 from 2 to 3
move 6 from 9 to 4
move 3 from 9 to 1
move 4 from 3 to 5
move 6 from 7 to 1
move 2 from 6 to 3
move 2 from 9 to 2
move 3 from 3 to 2
move 3 from 6 to 8
move 2 from 7 to 5
move 20 from 5 to 6
move 8 from 5 to 1
move 1 from 5 to 9
move 2 from 8 to 4
move 1 from 8 to 7
move 16 from 1 to 8
move 8 from 8 to 9
move 4 from 2 to 4
move 1 from 1 to 5
move 1 from 5 to 4
move 3 from 8 to 4
move 14 from 4 to 6
move 5 from 8 to 7
move 6 from 7 to 8
move 29 from 6 to 2
move 3 from 9 to 8
move 21 from 2 to 3
move 1 from 8 to 3
move 6 from 9 to 4
move 8 from 3 to 5
move 7 from 8 to 4
move 7 from 3 to 9
move 3 from 7 to 2
move 12 from 4 to 8
move 2 from 3 to 1
move 2 from 9 to 1
move 1 from 6 to 7
move 1 from 7 to 6
move 1 from 6 to 3
move 3 from 1 to 8
move 2 from 4 to 1
move 4 from 6 to 1
move 5 from 2 to 7
move 1 from 1 to 2
move 5 from 1 to 2
move 2 from 8 to 1
move 1 from 4 to 5
move 9 from 8 to 4
move 3 from 7 to 9
move 7 from 5 to 7
move 2 from 5 to 9
move 4 from 9 to 2
move 3 from 3 to 2
move 5 from 2 to 7
move 2 from 8 to 2
move 2 from 7 to 3
move 1 from 8 to 6
move 2 from 1 to 2
move 1 from 6 to 7
move 1 from 8 to 1
move 12 from 7 to 1
move 5 from 2 to 7
move 7 from 4 to 2
move 2 from 4 to 1
move 5 from 3 to 8
move 7 from 1 to 9
move 4 from 7 to 1
move 7 from 1 to 5
move 12 from 9 to 2
move 27 from 2 to 4
move 3 from 8 to 9
move 6 from 2 to 5
move 6 from 1 to 8
move 1 from 7 to 6
move 9 from 5 to 2
move 3 from 9 to 2
move 13 from 4 to 5
move 10 from 2 to 7
move 1 from 9 to 8
move 11 from 5 to 7
move 1 from 8 to 7
move 1 from 2 to 6
move 13 from 4 to 3
move 23 from 7 to 4
move 1 from 6 to 9
move 1 from 2 to 4
move 7 from 3 to 5
move 1 from 9 to 8
move 19 from 4 to 1
move 2 from 4 to 1
move 1 from 7 to 6
move 1 from 4 to 5
move 1 from 5 to 7
move 11 from 5 to 1
move 2 from 5 to 4
move 2 from 6 to 9
move 3 from 8 to 2
move 2 from 8 to 1
move 3 from 2 to 1
move 1 from 9 to 5
move 6 from 1 to 3
move 1 from 9 to 7
move 2 from 7 to 5
move 2 from 8 to 6
move 1 from 3 to 2
move 2 from 8 to 5
move 1 from 2 to 1
move 3 from 4 to 1
move 3 from 5 to 1
move 2 from 5 to 1
move 2 from 6 to 9
move 1 from 9 to 6
move 1 from 4 to 5
move 1 from 9 to 8
move 1 from 8 to 6
move 8 from 1 to 6
move 7 from 1 to 8
move 9 from 1 to 6
move 1 from 5 to 3
move 3 from 8 to 4
move 11 from 3 to 4
move 1 from 3 to 6
move 10 from 6 to 8
move 13 from 1 to 6
move 3 from 4 to 5
move 7 from 8 to 6
move 3 from 8 to 5
move 6 from 5 to 3
move 22 from 6 to 9
move 4 from 3 to 6
move 4 from 9 to 5
move 1 from 1 to 5
move 2 from 3 to 4
move 2 from 1 to 5
move 1 from 9 to 2
move 5 from 8 to 3
move 2 from 9 to 2
move 11 from 6 to 9
move 3 from 2 to 7
move 1 from 6 to 7
move 12 from 9 to 8
move 4 from 7 to 1
move 12 from 4 to 8
move 2 from 4 to 7
move 1 from 1 to 8
move 1 from 5 to 1
move 19 from 8 to 4
move 4 from 5 to 1
move 1 from 7 to 4
move 1 from 7 to 1
move 3 from 3 to 4
move 2 from 8 to 4
move 1 from 5 to 7
move 1 from 7 to 9
move 8 from 1 to 8
move 1 from 1 to 4
move 1 from 3 to 9
move 1 from 3 to 5
move 1 from 5 to 2
move 7 from 8 to 7
move 16 from 4 to 7
move 1 from 7 to 4
move 3 from 8 to 2
move 14 from 7 to 4
move 1 from 5 to 8
move 5 from 7 to 5
move 16 from 4 to 5
move 3 from 5 to 4
move 3 from 2 to 1
move 1 from 7 to 9
move 11 from 4 to 2
move 3 from 8 to 6
move 2 from 1 to 8
move 1 from 4 to 9
move 18 from 5 to 1
move 1 from 8 to 7
move 3 from 7 to 9
move 18 from 9 to 3
move 3 from 6 to 9
move 7 from 1 to 6
move 1 from 8 to 4
move 1 from 4 to 9
move 3 from 6 to 4
move 5 from 9 to 2
move 2 from 4 to 7
move 7 from 2 to 8
move 1 from 7 to 3
move 2 from 6 to 8
move 1 from 9 to 5
move 1 from 6 to 8
move 1 from 4 to 8
move 1 from 5 to 3
move 1 from 7 to 5
move 8 from 8 to 7
move 10 from 2 to 6
move 1 from 9 to 3
move 6 from 6 to 2
move 5 from 6 to 2
move 7 from 2 to 7
move 12 from 1 to 6
move 2 from 2 to 1
move 1 from 2 to 5
move 4 from 7 to 6
move 12 from 3 to 1
move 2 from 7 to 2
move 9 from 3 to 8
move 1 from 2 to 6
move 1 from 5 to 4
move 9 from 6 to 5
move 1 from 7 to 6
move 1 from 4 to 9
move 9 from 6 to 7
move 7 from 8 to 3
move 6 from 3 to 1
move 4 from 8 to 3
move 5 from 3 to 1
move 1 from 9 to 8
move 2 from 8 to 9
move 5 from 5 to 7
move 14 from 7 to 8
move 1 from 9 to 4
move 2 from 2 to 1
move 3 from 5 to 3
move 2 from 3 to 1
move 1 from 4 to 6
move 6 from 8 to 6
move 6 from 8 to 3
move 3 from 6 to 1
move 2 from 8 to 9
move 19 from 1 to 6
move 3 from 9 to 3
move 6 from 3 to 4
move 6 from 6 to 2
move 4 from 3 to 9
move 1 from 7 to 9
move 2 from 5 to 7
move 5 from 9 to 6
move 6 from 7 to 2
move 11 from 2 to 5
move 2 from 7 to 4
move 4 from 4 to 3
move 2 from 4 to 8
move 12 from 1 to 2
move 1 from 8 to 2
move 8 from 5 to 7
move 2 from 4 to 9
move 2 from 7 to 1
move 4 from 2 to 3
move 1 from 8 to 6
move 1 from 1 to 5
move 2 from 9 to 1
move 2 from 7 to 3
move 2 from 5 to 2
move 1 from 5 to 7
move 2 from 7 to 8
move 1 from 5 to 7
move 5 from 3 to 4
move 3 from 1 to 7
move 1 from 2 to 4
move 15 from 6 to 1
move 4 from 4 to 1
move 4 from 2 to 3
move 8 from 3 to 2
move 5 from 2 to 4
move 1 from 8 to 6
move 1 from 8 to 9
move 1 from 3 to 1
move 3 from 7 to 3
move 5 from 7 to 6
move 4 from 2 to 9
move 6 from 2 to 6
move 4 from 9 to 6
move 12 from 1 to 5
move 6 from 4 to 1
move 1 from 3 to 6
move 4 from 5 to 8
move 7 from 5 to 3
move 3 from 8 to 2
move 1 from 2 to 3
move 1 from 9 to 5
move 1 from 4 to 5
move 1 from 8 to 5
move 8 from 6 to 9
move 10 from 1 to 4
move 3 from 6 to 1
move 9 from 3 to 6
move 1 from 3 to 8
move 1 from 2 to 4
move 6 from 9 to 1
move 1 from 1 to 4
move 10 from 1 to 6
move 1 from 8 to 6
move 13 from 6 to 7
move 1 from 2 to 1
move 1 from 9 to 6
move 9 from 7 to 5
move 1 from 9 to 4
move 3 from 7 to 1
move 3 from 5 to 6
move 10 from 4 to 7
move 5 from 6 to 5
move 3 from 4 to 5
move 13 from 6 to 9
move 7 from 5 to 3
move 6 from 3 to 2
move 5 from 6 to 4
move 4 from 2 to 8
