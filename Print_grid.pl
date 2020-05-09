sub Print_grid {
    print "Board: \n";
    my @GameBoard = @{$_[0]};
    my $length = scalar @GameBoard;
    for(my $m = 0; $m < $length; $m++) {
		for(my $n = 0; $n < $length; $n++) {
			print("$GameBoard[$m][$n] ");
		}
		print("\n")
    }
}
1;
