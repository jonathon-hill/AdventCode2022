#!/usr/bin/perl

use strict;
use warnings;

use List::Util qw/sum/;

$\ = "\n";

my %scoring = (
    "X" => 1,
    "Y" => 2,
    "Z" => 3,
    "A" => 1,
    "B" => 2,
    "C" => 3,
);

my %strategy = (
    "X" => 0,
    "Y" => 3,
    "Z" => 6,
    "0" => 3,
    "1" => 6,
    "2" => 0
);

my %win_lose_draw = (
    "X" => 2,
    "Y" => 0,
    "Z" => 1
);

open(FH, '<', "day2_input.dat");

my @results1 = ();
my @results2 = ();

while (<FH>) {
    chomp;
    my ($opponent, $throw) = split(/\s+/, $_);
    push @results1, $scoring{$throw} + score_game($opponent, $throw);
    push @results2, $strategy{$throw} + score_throw($opponent, $throw);
}

close(FH);
print sum(@results1);
print sum(@results2);

sub score_game {
    my ($opponent, $throw) = @_;
    my $r = (($scoring{$throw} - 1) - ($scoring{$opponent} - 1)) % 3;
    return $strategy{$r};
}

sub score_throw {
    my ($opponent, $result) = @_;
    my $throw = (($scoring{$opponent} - 1) + $win_lose_draw{$result}) % 3 ;
    return $throw + 1;
}
