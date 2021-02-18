sub Print_grid {
	print "\033[2J";    #clear the screen
	print "\033[0;0H";
    print "Board: \n";
    my @GameBoard = @{$_[0]};
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			if ($n != 0) {
				print "| ";
			} else {
				print " ";
			}
			my $out = " ";
			my $gbr = $GameBoard[$m][$n];
			if ($gbr == 1)
			{
				$out = "X";
			} elsif ($gbr == 2) {
				$out = "O";
			}
			print("$out ");
		}
		print("\n");
		if ($m != 2){
			print "---+---+---\n";
		}
    }
}

1;
