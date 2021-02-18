# This function loops through all positions: left to right, top to bottom to find the first empty spot
sub MakeRobotMove {
    my @GameBoard = @{$_[0]};
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			if ($GameBoard[$m][$n] == 0) {
				MakeMove($m, $n, 2, \@GameBoard);
				return 1;
			}
		}
    }
	return 0;
}
1;
