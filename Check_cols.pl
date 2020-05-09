sub Check_cols {
	# Checks if there's a match for rows

	my (@myarray, $choice) = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[0][$i] == $myarray[1][$i]) &&
			($myarray[1][$i] == $myarray[2][$i]) && $myarray[0][$i] != 0) {
				if ($choice == 1 && $myarray[2][$i] == 2) {
					print "CPU WON!\n";
				}
				else {
					print "Player " . $myarray[2][$i] . " WON!\n";
				}
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}
1;
