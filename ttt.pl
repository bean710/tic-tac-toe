#!/usr/bin/perl
#Main perl file
use warnings;
use strict;

require 'Check_rows.pl';
require 'CheckSetRobot.pl';
require 'Check_cols.pl';
require 'Check_diag.pl';
require 'CheckSetPlayer.pl';
require 'Print_grid.pl';
require 'MakeSmartMove.pl';
require 'MakeRobotMove.pl';
require 'MakeMove.pl';

my @GameBoard = ([0, 0, 0], [0, 0, 0], [0, 0, 0]);
my $choice = 1;
my $turn = 1;
my $counter = 0;
my $isGame = 1;
my $player1 = "X";
my $player2 = "O";
#my %GB = {
#	'00' => 0, '01' => 0, '02' => 0,
#	'10' => 0, '11' => 0, '12' => 0,
#	'20' => 0, '21' => 0, '22' => 0
#};

=pod
sub MakeMove {
	my ($x, $y, $player) = @_;

	if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
		return 0;
	}

	if ($player == 2) {
		print "Computer made move $x, $y\n";
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

sub MakeSmartRobotMove {
	my $i = 0;

	#Checking if robot can make a move to win
	foreach $i (0..2) {
		my $n = CheckSetRobot($GameBoard[$i][0], $GameBoard[$i][1], $GameBoard[$i][2]);
		if ($n != -1) {
			MakeMove($i, $n, 2);
			return 1;
		}
	}

	foreach $i (0..2) {
		my $n = CheckSetRobot($GameBoard[0][$i], $GameBoard[1][$i], $GameBoard[2][$i]);
		if ($n != -1) {
			MakeMove($n, $i, 2);
			return 1;
		}
	}

	my $n = CheckSetRobot($GameBoard[0][0], $GameBoard[1][1], $GameBoard[2][2]);
	if ($n != -1) {
		MakeMove($n, $n, 2);
		return 1;
	}

	$n = CheckSetRobot($GameBoard[0][2], $GameBoard[1][1], $GameBoard[2][0]);
	if ($n != -1) {
		MakeMove($n, 2 - $n, 2);
		return 1;
	}

	#Checking if robot can make move to block player
	foreach $i (0..2) {
		my $n = CheckSetPlayer($GameBoard[$i][0], $GameBoard[$i][1], $GameBoard[$i][2]);
		if ($n != -1) {
			MakeMove($i, $n, 2);
			return 1;
		}
	}

	foreach $i (0..2) {
		my $n = CheckSetPlayer($GameBoard[0][$i], $GameBoard[1][$i], $GameBoard[2][$i]);
		if ($n != -1) {
			MakeMove($n, $i, 2);
			return 1;
		}
	}

	$n = CheckSetPlayer($GameBoard[0][0], $GameBoard[1][1], $GameBoard[2][2]);
	if ($n != -1) {
		MakeMove($n, $n, 2);
		return 1;
	}

	$n = CheckSetPlayer($GameBoard[0][2], $GameBoard[1][1], $GameBoard[2][0]);
	if ($n != -1) {
		MakeMove($n, 2 - $n, 2);
		return 1;
	}

	#Make dumb move
	return MakeRobotMove();
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

sub Print_grid {
    print "Board: \n";
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			my $gbr = $GameBoard[$m][$n];
			if ($gbr == 1){
				print "$player1 ";
			} elsif ($gbr == 2) {
				print "$player2 ";
			} else {
				print "* ";
			}
		}
		print("\n")
    }
}
=cut


sub Main {
	print "VS CPU [1] or VS Player [2] or : ";
	my $choice = <STDIN>;

	while ($choice != 1 && $choice != 2)
	{
		print "Invalid Input!\n";
		print "VS CPU [1] or VS Player [2] or : ";
		$choice = <STDIN>;
	}

	my $ret = "";
	my $isGame = 1;
	while ($isGame) {
		print "Enter x coordinate: ";
		my $x = <STDIN>;
		print "Enter y coordinate: ";
		my $y = <STDIN>;

		$x =~ s/[^0-9]*//g;
		$y =~ s/[^0-9]*//g;

		if ($choice == 1) {
			$ret = MakeMove($y, $x, 1, \@GameBoard);
		}
		elsif ($choice == 2) {
			if ($turn == 1) {	
			$ret = MakeMove($x, $y, $turn, \@GameBoard);	
			$turn = 2;	
			}	
			elsif ($turn == 2) {	
				$ret = MakeMove($x, $y, $turn, \@GameBoard);	
				$turn = 1;	
			}
		}

		if ($ret == 0) {
			print "Invalid move! Try again.\n";
			Print_grid(\@GameBoard);
			next;
		}
		#print "You made move at x:$x y:$y\n";

		if ($choice == 1) {
			MakeSmartRobotMove(\@GameBoard);
			print "Computer moved: \n";
		}

		Print_grid(\@GameBoard);
		$counter = $counter + 1;

		if (Check_rows(@GameBoard, $choice) == 1 || 
			Check_cols(@GameBoard, $choice) == 1 || 
			Check_diag(@GameBoard, $choice) == 1) {
			$isGame = 0;
		}
		elsif ($counter == 9) {
			print "DRAW!\n";
			$isGame = 0;
		}
	}
	print "Status: $isGame";
}
Main();
