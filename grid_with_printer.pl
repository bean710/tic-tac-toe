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
    my @grid = ( [' ', ' ', ' '],
                  [' ', ' ', ' '],
		 [' ', ' ', ' '] );
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
    }
Main();
