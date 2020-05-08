#!/usr/bin/perl

sub driver {
	my @items = ( (1, 2, 3),(4, 5, 6),(7, 8, 9) ); 

	my $res = Check_cols(@items);
	print $res;
	print "\n";
}

sub Check_cols {
	my @myarray = @_;
	for (my $i = 0; $i < 3; $i++) {
		if (($myarray[0][$i] == $myarray[1][$i]) &&
			($myarray[1][$i] == $myarray[2][$i])) {
				return 1; # Returns True
		}
	}
	return 0; # Returns False
}

driver();
