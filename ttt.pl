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
my $choice = 1;
my $turn = 1;
my $counter = 0;
my $isGame = 1;
my $player1 = "X";
my $player2 = "O";
#my %GB = {
#	'00' => 0, '01' => 0, '02' => 0,
#	'10' => 0, '11' => 0, '12' => 0,
#	'20' => 0, '21' => 0, '22' => 0
#};

sub Main {
	# Prompt the player to pick 1 or 2 players
	print "VS CPU [1] or VS Player [2] or : ";
	my $choice = <STDIN>;

	# Validate response
	while ($choice != 1 && $choice != 2)
	{
		print "Invalid Input!\n";
		print "VS CPU [1] or VS Player [2] or : ";
		$choice = <STDIN>;
	}

	my $ret = "";
	my $isGame = 1;
	Print_grid(\@GameBoard);
	while ($isGame) {
		if ($choice == 2) {
			print "Player $turn\'s turn\n";
		}
		print "Enter x coordinate: ";
		my $x = <STDIN>;
		print "Enter y coordinate: ";
		my $y = <STDIN>;

		$x =~ s/[^0-9]*//g;
		$y =~ s/[^0-9]*//g;

		# Submit the player's move to the game board
		$ret = MakeMove($y, $x, $turn, \@GameBoard);

		if ($ret == 0) {
			# The move was invalid, prompt player again
			Print_grid(\@GameBoard);
			print "Invalid move! Try again.\n";
			next;
		}

		if ($choice == 2) {
			if ($turn == 1) {	
				$turn = 2;	
			}	
			elsif ($turn == 2) {	
				$turn = 1;	
			}
		}
		#print "You made move at x:$x y:$y\n";

		# If the player is playing against the computer, make a computer move
		if ($choice == 1) {
			MakeSmartRobotMove(\@GameBoard);
			print "Computer moved: \n";
		}

		Print_grid(\@GameBoard);
		$counter = $counter + 1;

		# Check if anybody has won
		if (Check_rows(@GameBoard, $choice) == 1 || 
			Check_cols(@GameBoard, $choice) == 1 || 
			Check_diag(@GameBoard, $choice) == 1) {
			$isGame = 0;
		}
		elsif ($counter == 9) {
			print "DRAW!\n";
			$isGame = 0;
		}
	}
	print "Status: $isGame";
}
Main();
