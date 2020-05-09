#!/usr/bin/perl
#Main perl file
use warnings;
use strict;
use Data::Dump 'dump';

my @GameBoard = ([0, 0, 0], [0, 0, 0], [0, 0, 0]);
my $turn = 1;
my $counter = 0;
my $isGame = 1;
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

sub Check_all {
	# Checks all
	if (Check_rows(@GameBoard) == 1 || 
			Check_cols(@GameBoard) == 1 || 
			Check_diag(@GameBoard) == 1) {
			$isGame = 0;
			print "Someone WON!\n"
		}
}

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

sub CheckSetPlayer {
	my ($a, $b, $c) = @_;

	#print "Checking: $a$b$c\n";

	if ($a == 1 and $b == 1 and $c == 0) {
		return 2;
	}
	if ($a == 1 and $b == 0 and $c == 1) {
		return 1;
	}
	if ($a == 0 and $b == 1 and $c == 1) {
		return 0;
	}

	return -1;
}

sub CheckSetRobot {
	my ($a, $b, $c) = @_;

	#print "Checking: $a$b$c\n";

	if ($a == 2 and $b == 2 and $c == 0) {
		return 2;
	}
	if ($a == 2 and $b == 0 and $c == 2) {
		return 1;
	}
	if ($a == 0 and $b == 2 and $c == 2) {
		return 0;
	}

	return -1;
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

sub User_input {
	print "Player 1, please choose a symbol 'X' or 'O'\n";
	print "input: ";
	my $player1 = <STDIN>; 
	chomp $player1;

	return $player1;
}

sub Main {
	print "How many players? (1 or 2): ";
	my $pnum = <STDIN>;
	chomp $pnum;
	if ($pnum == 2) {
		my $player1 = User_input();
		my $player2 = "";
		chomp $player1;
		if ($player1 eq "X") {
			$player2 = "O";
		}
		elsif ($player1 eq "O") {
			$player2 = "X";
		}
		else {
			return;
		}
	}

	$isGame = 1;
	while ($isGame) {
		my $ret = 1;
		my $x = 0;
		my $y = 0;
		if (($pnum == 2) or $turn == 1) {
			print "Player $turn\'s turn\n";
			print "Enter x coordinate: ";
			$y = <STDIN>;
			$ret = 0;
			print "Enter y coordinate: ";
			$x = <STDIN>;

			$x =~ s/[^0-9]*//g;
			$y =~ s/[^0-9]*//g;
		}

		if ($turn == 1)
		{
			$ret = MakeMove($x, $y, $turn);
			if ($ret == 0) {
				print "Invalid move! Try again.\n";
				Print_grid();
				next;
			}
			$turn = 2;
		}
		elsif ($turn == 2)
		{
			if ($pnum == 2) {
				$ret = MakeMove($x, $y, $turn);
				if ($ret == 0) {
					print "Invalid move! Try again.\n";
					Print_grid();
					next;
				}
				$turn = 1;
			}
			else {
				MakeSmartRobotMove();
				print "Computer moved: \n";
				$turn = 1;
				$ret = 1;
			}
		}
		#print "You made move at x:$x y:$y\n";
		Print_grid();

		Check_all();

	}
	print "Status: $isGame";
}

# Print_grid();
Main();
