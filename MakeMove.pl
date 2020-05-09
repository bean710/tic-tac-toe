sub MakeMove {
        my @GameBoard = @{$_[3]};
	my ($x, $y, $player) = @_;

	if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
		return 0;
	}

	if ($player == 2) {
		print "Made move $x, $y\n";
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
1;
