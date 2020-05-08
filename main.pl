#!/usr/bin/perl
#Main perl file
use warnings;
use strict;
use Data::Dump 'dump';

my @GameBoard = ([0, 0, 0], [0, 0, 0], [0, 0, 0]);
#my %GB = {
#	'00' => 0, '01' => 0, '02' => 0,
#	'10' => 0, '11' => 0, '12' => 0,
#	'20' => 0, '21' => 0, '22' => 0
#};

sub MakeMove {
	my ($x, $y) = @_;

	if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
		return 0;
	}

	#my $coord = $x.$y."";
	#print "Coord: $coord\n";
	#my $val = $GB{'00'};
	my $val = $GameBoard[$x][$y];
	print "On val: $val\n";
	if ($val != 0) {
		return 0;
	} else {
		$GameBoard[$x][$y] = 1;
		return 1;
	}

	return 0;
}

# Print_grid(@name)
sub Print_grid {
    print "Board: \n";
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			print("$GameBoard[$m][$n] ");
		}
	print("\n")
    }
}

sub Main {
	my $isGame = 1;
	while ($isGame) {
		print "Enter x coordinate: ";
		my $x = <STDIN>;

		print "Enter y coordinate: ";
		my $y = <STDIN>;

		$x =~ s/[^0-9]*//g;
		$y =~ s/[^0-9]*//g;

		my $ret = MakeMove($x, $y);

		if ($ret == 0) {
			print "Invalid move! Try again.\n";
			next;
		}

		print "Made move at x:$x y:$y\n";

		Print_grid(@GameBoard);
	}
	print "Status: $isGame";
}

Main();
