#!/usr/bin/perl

sub driver {
	my @items = ( [0, 0, 0],[0, 0, 0], [0, 0, 0] ); 

	Check_all(@items);
}

sub Check_cols {
	# Checks if there's a match for rows

	my @myarray = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[0][$i] == $myarray[1][$i]) &&
			($myarray[1][$i] == $myarray[2][$i]) && $myarray[0][$i] != 0) {
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}

sub Check_rows {
	# Checks if there's a match for cols

	my @myarray = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[$i][0] == $myarray[$i][1]) &&
			($myarray[$i][1] == $myarray[$i][2]) && $myarray[$i][0] != 0) {
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}

sub Check_diag {
	# Checks if there's a match for diags

	my @myarray = @_;

	if (($myarray[0][0] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][2]) && $myarray[0][0] != 0) {
			return 1; # Returns True
		}
	elsif (($myarray[0][2] == $myarray[1][1]) &&
		($myarray[1][1] == $myarray[2][0]) && $myarray[0][2] != 0) {
			return 1; # Returns True
		}
	else {
		return 0; # Returns False
	}
}
driver();
