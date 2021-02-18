# This function checks if three positions are all taken by the computer
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
1;
