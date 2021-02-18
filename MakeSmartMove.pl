sub MakeSmartRobotMove {
    my $i = 0;
    my @GameBoard = @{$_[0]};

	# Checking if robot can make a move to win
	# This loop checks the horizontal possible wins
	foreach $i (0..2) {
		my $n = CheckSetRobot($GameBoard[$i][0], $GameBoard[$i][1], $GameBoard[$i][2]);
		if ($n != -1) {
			MakeMove($i, $n, 2, \@GameBoard);
			return 1;
		}
	}

	# This loop checks the vertical possible wins
	foreach $i (0..2) {
		my $n = CheckSetRobot($GameBoard[0][$i], $GameBoard[1][$i], $GameBoard[2][$i]);
		if ($n != -1) {
			MakeMove($n, $i, 2, \@GameBoard);
			return 1;
		}
	}

	# This checks for a top-left to bottom-right diagonal win move
	my $n = CheckSetRobot($GameBoard[0][0], $GameBoard[1][1], $GameBoard[2][2]);
	if ($n != -1) {
		MakeMove($n, $n, 2, \@GameBoard);
		return 1;
	}

	# This checks for a top-right to bottom-left diagonal win move
	$n = CheckSetRobot($GameBoard[0][2], $GameBoard[1][1], $GameBoard[2][0]);
	if ($n != -1) {
		MakeMove($n, 2 - $n, 2, \@GameBoard);
		return 1;
	}

	#Checking if robot can make move to block player
	# This checks for horizontal blocking moves
	foreach $i (0..2) {
		my $n = CheckSetPlayer($GameBoard[$i][0], $GameBoard[$i][1], $GameBoard[$i][2]);
		if ($n != -1) {
			MakeMove($i, $n, 2, \@GameBoard);
			return 1;
		}
	}

	# This checks for vertical blocking moves
	foreach $i (0..2) {
		my $n = CheckSetPlayer($GameBoard[0][$i], $GameBoard[1][$i], $GameBoard[2][$i]);
		if ($n != -1) {
			MakeMove($n, $i, 2, \@GameBoard);
			return 1;
		}
	}

	# This checks for top-left to bottom-right blocking move
	$n = CheckSetPlayer($GameBoard[0][0], $GameBoard[1][1], $GameBoard[2][2]);
	if ($n != -1) {
		MakeMove($n, $n, 2, \@GameBoard);
		return 1;
	}

	# This checks for top-right to bottom-left blocking move
	$n = CheckSetPlayer($GameBoard[0][2], $GameBoard[1][1], $GameBoard[2][0]);
	if ($n != -1) {
		MakeMove($n, 2 - $n, 2, \@GameBoard);
		return 1;
	}

	#Make dumb move
	return MakeRobotMove(\@GameBoard);
}
1;
