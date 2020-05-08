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

sub Check_cols {
	# Checks if there's a match for rows

	my @myarray = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[0][$i] == $myarray[1][$i]) &&
			($myarray[1][$i] == $myarray[2][$i]) && $myarray[0][$i] != 0) {
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}

sub Check_rows {
	# Checks if there's a match for cols

	my @myarray = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[$i][0] == $myarray[$i][1]) &&
			($myarray[$i][1] == $myarray[$i][2]) && $myarray[$i][0] != 0) {
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}

sub Check_diag {
	# Checks if there's a match for diags

	my @myarray = @_;

	if (($myarray[0][0] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][2]) && $myarray[0][0] != 0) {
			return 1; # Returns True
		}
	elsif (($myarray[0][2] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][0]) && $myarray[0][2] != 0) {
			return 1; # Returns True
		}
	else {
		return 0; # Returns False
	}
}

sub MakeMove {
	my ($x, $y, $player) = @_;

	if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
		return 0;
	}

	#my $coord = $x.$y."";
	#print "Coord: $coord\n";
	#my $val = $GB{'00'};
	my $val = $GameBoard[$x][$y];
	#print "On val: $val\n";
	if ($val != 0) {
		return 0;
	} else {
		$GameBoard[$x][$y] = $player;
		return 1;
	}

	return 0;
}

sub MakeRobotMove {
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			if ($GameBoard[$m][$n] == 0) {
				MakeMove($m, $n, 2);
				return 1;
			}
		}
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
	# print "Player 1, please choose a symbol 'X' or 'O'"
	# my $player1 = <STDIN>;

	# if ($player1 == "X")


	my $isGame = 1;
	while ($isGame) {
		print "Enter x coordinate: ";
		my $x = <STDIN>;

		print "Enter y coordinate: ";
		my $y = <STDIN>;

		$x =~ s/[^0-9]*//g;
		$y =~ s/[^0-9]*//g;

		my $ret = MakeMove($x, $y, 1);

		if ($ret == 0) {
			print "Invalid move! Try again.\n";
			Print_grid();
			next;
		}

		print "You made move at x:$x y:$y\n";
		Print_grid();

		MakeRobotMove();
		print "Computer moved: \n";
		Print_grid();

		if (Check_rows(@GameBoard) == 1 || 
			Check_cols(@GameBoard) == 1 || 
			Check_diag(@GameBoard) == 1) {
			$isGame = 0;
			print "Someone WON!\n"
		}
	}
	print "Status: $isGame";
}

# Print_grid();
Main();
