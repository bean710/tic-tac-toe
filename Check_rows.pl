sub Check_rows {
	# Checks if there's a match for cols

	my (@myarray, $choice) = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[$i][0] == $myarray[$i][1]) &&
			($myarray[$i][1] == $myarray[$i][2]) && $myarray[$i][0] != 0) {
				if ($choice == 1 && $myarray[$i][2] == 2) {
					print "CPU WON!\n";
				}
				else {
					print "Player " . $myarray[$i][2] . " WON!\n";
				}
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}
1;
