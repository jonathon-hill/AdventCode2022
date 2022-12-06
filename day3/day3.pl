#!/usr/bin/perl

use strict;
use warnings;
use List::Util qw/sum/;
$\ = "\n";

open(FH, '<', "day3_input.dat") or die $!;

my @priorities = ();
my @group = ();
my @groupPriorities = ();

while (my $line = <FH>) {
    chomp $line;
    
    my (%combined, %pocket1, %pocket2);
    $combined{$_}++ for split(//, $line);
    $pocket1{$_}++ for split(//, substr($line, 0, length($line) / 2));
    $pocket2{$_}++ for split(//, substr($line, length($line) / 2));

    my @shared = intersect([keys(%pocket1)], [keys(%pocket2)]);
    push @priorities, score($shared[0]);
    
    push @group, [keys %combined];
    if (scalar(@group) == 3) {
	my @isect = intersect(shift @group, shift @group);
	@isect = intersect(\@isect, shift @group); 
	push @groupPriorities, score($isect[0]);
    }
}
close(FH);

print(sum(@priorities));
print(sum(@groupPriorities));
    
sub score {
    my $charVal = 1 + ord(shift) - ord('a');
    if ($charVal < 0) {
	$charVal = $charVal + 58;
    }
    return $charVal;
}


sub intersect {
    my ($a1, $a2) = @_;
    my @insersection = ();

    for my $v (@$a1) {
	if (grep /^$v$/, @$a2) {
	    push @insersection, $v;
	}
    }

    return @insersection;
}
