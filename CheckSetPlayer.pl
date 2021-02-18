# This function checks if three positions are all taken by the player
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
1;
