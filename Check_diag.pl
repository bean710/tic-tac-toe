sub Check_diag {
	# Checks if there's a match for diags

	my (@myarray, $choice) = @_;

	if (($myarray[0][0] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][2]) && $myarray[0][0] != 0) {
			if ($choice == 1 && $myarray[2][2] == 2) {
					print "CPU WON!\n";
			}
			else {
				print "Player " . $myarray[2][2] . " WON!\n";
			}
			return 1; # Returns True
		}
	elsif (($myarray[0][2] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][0]) && $myarray[0][2] != 0) {
			if ($choice == 1 && $myarray[2][0] == 2) {
					print "CPU WON!\n";
			}
			else {
				print "Player " . $myarray[2][0] . " WON!\n";
			}
			return 1; # Returns True
		}
	else {
		return 0; # Returns False
	}
}
1;
