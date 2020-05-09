#!/usr/bin/perl
#Main perl file
use warnings;
use strict;

require 'Check_rows.pl';
require 'CheckSetRobot.pl';
require 'Check_cols.pl';
require 'Check_diag.pl';
require 'CheckSetPlayer.pl';
require 'Print_grid.pl';
require 'MakeSmartMove.pl';
require 'MakeRobotMove.pl';
require 'MakeMove.pl';

my @GameBoard = ([0, 0, 0], [0, 0, 0], [0, 0, 0]);
#my %GB = {
#	'00' => 0, '01' => 0, '02' => 0,
#	'10' => 0, '11' => 0, '12' => 0,
#	'20' => 0, '21' => 0, '22' => 0
#};

sub Main {
	# print "Player 1, please choose a symbol 'X' or 'O'"
	# my $player1 = <STDIN>;

	# if ($player1 == "X")


	my $isGame = 1;
	while ($isGame) {
		print "Enter x coordinate: ";
		my $x = <STDIN>;

		print "Enter y coordinate: ";
		my $y = <STDIN>;

		$x =~ s/[^0-9]*//g;
		$y =~ s/[^0-9]*//g;

		my $ret = MakeMove($x, $y, 1, \@GameBoard);

		if ($ret == 0) {
			print "Invalid move! Try again.\n";
			Print_grid(\@GameBoard);
			next;
		}

		print "You made move at x:$x y:$y\n";
		Print_grid(\@GameBoard);

		MakeSmartRobotMove(\@GameBoard);
		print "Computer moved: \n";
		Print_grid(\@GameBoard);

		if (Check_rows(@GameBoard) == 1 || 
			Check_cols(@GameBoard) == 1 || 
			Check_diag(@GameBoard) == 1) {
			$isGame = 0;
			print "Someone WON!\n"
		}
	}
	print "Status: $isGame";
}
Main();
