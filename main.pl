#Main perl file

my @GameBoard = ((0, 0, 0), (0, 0, 0), (0, 0, 0));

sub MakeMove {
	my ($x, $y) = @_;

	if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
		return 0;
	}

	if ($GameBoard[$x][$y] != 0) {
		return 0;
	} else {
		$GameBoard[$x][$y] = 1;
	}
	return 1;
}

# Print_grid(@name)
sub Print_grid {
    my @myarray = @{matrix};
    for(my $m = 0; $m <= $#myarray; $m++) {
		for(my $n = 0; $n <= $#myarray; $n++) {
			print("$myarray[$m][$n] ");
		}
		print("\n");
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
}

Main();
