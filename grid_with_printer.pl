#!usr/bin/perl
#Main perl file

use strict;

sub MakeMove {
    my ($x, $y) = @_;
    if ($x < 0 or $x > 2 or $y < 0 or $y > 2) {
        return 0;
    }
    return 1;

sub Main {
    my $isGame = 1;
    my @grid = ( ['a', 'b', 'c'],
                  ['d', 'e', 'f'],
		 ['g', 'h', 'i'] );

    while ($isGame) {
        print "Enter x coordinate: ";
        my $x = <STDIN>;
        print "Enter y coordinate: ";
        my $y = <STDIN>;
        my $ret = MakeMove($x, $y);

        if ($ret == 0) {
            print "Invalid move! Try again.\n";
            next;
        }
        $grid[$x][$y] = 'x';

        print "Made move at x:$x y:$y\n";

        foreach my $m (0..2)
        {
	    foreach my $n (0..2)
            {
		print "$grid[$m][$n] ";
            }
            print "\n";
        }

	if (($grid[0][0] eq $grid[0][1] && $grid[0][1] eq $grid[0][2]) or
            ($grid[1][0] eq $grid[1][1] && $grid[1][1] eq $grid[1][2]) or
            ($grid[2][0] eq $grid[2][1] && $grid[2][1] eq $grid[2][2]))
	{print "Row win";}

        elsif(($grid[0][0] eq $grid[1][0] && $grid[1][0] eq $grid[2][0]) or
              ($grid[0][1] eq $grid[1][1] && $grid[1][1] eq $grid[2][1]) or
              ($grid[0][2] eq $grid[1][2] && $grid[1][2] eq $grid[2][2]))
	{print "Column win\n";}

        elsif (($grid[0][0] eq $grid[1][1] &&  $grid[1][1] eq $grid[2][2]) or
               ($grid[2][0] eq $grid[1][1] &&  $grid[1][1] eq $grid[0][2]))
	{print "Diagnal win\n";}
    }
}
Main();
