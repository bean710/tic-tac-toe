# How to Write a Tic-Tac-Toe Game in Perl

## Intro

Today, we’re going to teach you how to write a tic tac toe game in Perl. 
Literally less than 12 hours ago, we’ve never even used Perl and for most of us, 
we’ve only ever heard of the language or it sounds like something shiny you’d gift your mother. 


In this version of our implementation of the game, you will be able to run Tic-Tac-Toe right in your
terminal.

## Background

Perl was developed in 1987 by Larry Wall as a more practical alternative to shell scripting. 
Since it was designed in the Unix environment, it retains many Unix characteristics. 
The language itself borrows sed and awk as well as from the C programming language. 

Considered a high-level multi-purpose language, Perl is dynamic and suitable for solving various tasks. 
It was designed to be easy to use for both finding solutions to simple problems. 
It has since evolved where Perl 5 was first released in 1994 so that it can be used in larger 
full-featured object oriented developmental environments.

Perl is an interpreted language and thus requires an interpreter to execute the scripts. 

Some of the common uses that people use Perl 5:
* System administration
* Database systems
* Content management
* Web development 

---

## Tic Tac Toe

The goal of Tic Tac Toe is simple. 
There are 2 players and the first one to connect 3 of their pieces wins. 
While you try to make the connection happen, you also have to prevent your opponent from making a row, 
column, or diagonal of 3 first. (Hint: Most people try to go for the middle grid first 
because that connects them to 4 possible connections in just one spot).


---
## Demo

**List of files**:

* CheckSetPlayer.pl 

* CheckSetRobot.pl 

* Check_cols.pl 

* Check_diag.pl 

* Check_rows.pl 

* MakeMove.pl 

* MakeRobotMove.pl 

* MakeSmartMove.pl 

* Print_grid.pl

* ttt.pl 


### Getting Started


You can run your Perl file, ```ttt.pl``` in 2 ways:


```
tic-tac-toe$ perl ttt.pl
tic-tac-toe$
```

```
tic-tac-toe$ ./ttt.pl
tic-tac-toe$
```
If the above commands show errors, feel free to use a docker image to run this game. We wrote this in Perl 5 version 18 but 
different users may have differebt versions altogether.


Follow this step by step to run this game in our container. Ensure that you start in this local repo's directory.
## Getting Started With Docker
```
tic-tac-toe$ sudo docker build .
tic-tac-toe$ sudo docker images 
REPOSITORY              TAG                 IMAGE ID            CREATED              VIRTUAL SIZE
<none>                  <none>              8ed452f3d25c        About an hour ago    196.5 MB
<none>                  <none>              78cc26347a1f        About an hour ago    196.5 MB
ubuntu                  trusty              2a008d071fde        4 months ago         196.5 MB
```
Using the IMAGE ID of the docker image most recently created if successful, copy that ID and continue on:
```
sudo docker run -it <IMAGE ID>
```
And that's it! The game should start. Hint: to exit the game, ```CTRL + P + Q```.



### Choose how you want to play
You will be prompted with whether you want to play against the computer or another (locally):
```
tic-tac-toe$: ./ttt.pl
VS CPU [1] or VS Player [2] or :
```

### Playing against CPU 
Enter 1 and hit RETURN to play against the computer. You will be prompted to enter the coordinates to go first.
```
tic-tac-toe$: ./ttt.pl
VS CPU [1] or VS Player [2] or : 1
Board:
   |   |
---+---+---
   |   |
---+---+---
   |   |
Enter x coordinate:
Enter y coordinate
```

### First move
```
Enter x coordinate: 0
Enter y coordinate: 0
Board:
 X | O |
---+---+---
   |   |
---+---+---
   |   |
```
You will see that you are the X and the computer makes a move as 0 on our grid. 
You will be prompted to make another coordinate:
```
Enter x coordinate: 1
Enter y coordinate: 1
Board:
 X | O |
---+---+---
   | X |
---+---+---
   |   | O
 
```
And again, the computer makes a move.
But wait! The computer is smart and blocks you! 

### Invalid Inputs 1
```
Enter x coordinate: 5
Enter y coordinate: 9
Board:
 X | O |
---+---+---
   | X |
---+---+---
   |   | O
Invalid move! Try again.
```
You also can't make coordinates that are outside of the grid as shown above.

### Invalid Inputs 2
```
Enter x coordinate: 1
Enter y coordinate: 1
Board:
 X | O |
---+---+---
   | X |
---+---+---
   |   | O
Invalid move! Try again.
```
You also can't try to put your piece on a grid that is already taken up

### Invalid Inputs 3
```
Enter x coordinate: h
Enter y coordinate: n
Board:
 X | O |
---+---+---
   | X |
---+---+---
   |   | O
Invalid move! Try again.
```
And lastly, you can only input numbers.

### Someone won!
Let's make some more moves.
```
Enter x coordinate: 0
Enter y coordinate: 2
Board:
 X | O |
---+---+---
 O | X |
---+---+---
 X |   | O
```

```
Enter x coordinate: 2
Enter y coordinate: 0
Board:
 X | O | X
---+---+---
 O | X | 
---+---+---
 X |   | O
 Player 1 Won!
```
If you are playing against a player 2, the format is similar. The only big difference
is that instead of the computer automatically (and quite cunningly) makes the moves, 
the screen prompts you to input coordinates manually again for player 2 (whether that
is for your friend or if you are playing by yourself).


---
## How to Write Tic Tac Toe in Perl

Since Perl is an interpreted language and mostly platform independent 
(some of us pleasantly found that Perl is already pre-installed into our machines), 
a script that we write on Unix can be executed without any alterations on Windows, 
as long as we’re not using features that are available in the one environment and not the other. 


We have embedded into that string multiple variables throughout our files and
those are all automatically interpolated. Perl does this naturally, unlike in Python or C 
so you can just include variables in a string and the result will be their values. 

### In C:
```
#include <stdio.h>

int main (void)
{
	int num;
  
        for (num = 0; num < 10; num++)
        {
          printf("%i", num);
          printf("\n");
         }
	  return (0);
}
```
Notice that we have to use the integer format specifier that will designate where num will be placed in the print statement.


### Output:
```
0
1
2
3
4
5
6
7
8
9
```


### In Python3:
```
#!/usr/bin/env python3
num = 0
while num < 10:
  print('{}'.format(num))
  num += 1
```

### Output:
```
0
1
2
3
4
5
6
7
8
9
```

### In Perl:
```
#!/usr/bin/env perl
use warnings;
use strict;

my @a = (0..9);
my $i = 20;

for $i (@a) {
  print("$i", "\n");
 }

```


### Output:
```
0
1
2
3
4
5
6
7
8
9
```

Notice that the variable i automatically interpolates. 


While we were getting started with learning a whole new langauge before diving into creating this game,
we knew we were going to get our hands dirty with the amount of heavy lifting that we're going to require our functions to do.
As novices to the language, we started off with one huge gigantic ```main.pl``` file but through lots of trial and error, were 
able to break that up into the associatively named files. 

In order for our main file, called ```ttt.pl``` to "see" functions in other files, we had to use ```require``` which works much like import does in Python. Here's a block of our ```ttt.pl``` file to show just how many files we imported on. The scope of those variables now lie beyond just where they are written.

```
require 'Check_rows.pl';
require 'CheckSetRobot.pl';
require 'Check_cols.pl';
require 'Check_diag.pl';
require 'CheckSetPlayer.pl';
require 'Print_grid.pl';
require 'MakeSmartMove.pl';
require 'MakeRobotMove.pl';
require 'MakeMove.pl';
```
Semicolons are used as seperators between statements. Though the very last line of your code can omit the semicolon, it is considered best practice to include it. This also prevents any errors that may occur if you make any edits in the future.

Perl supports 3 different data types. Scalar, array, hash.
We required multiple variables that would handle our grid/GameBoard, which player you are, who's turn it is, the number of moves made (up to 9), if the game is still valid, and the 'X' and '0' symbols that would be placed on the grid.

As if this language was made for this project of creating a Tic-Tac-Toe game, we found that with 3 variables in Perl, one of them was an array and we needed ~~an array~~ a 2D array for our grid. That was initialized as ```my @GameBoard = ([0, 0, 0], [0, 0, 0], [0, 0, 0]);``` while the other variables, which are scalar, were initialized as ```my $counter = 0;```.

Since this is a game, we wanted to implement the functionality of "turns" and "players". It's fairly straightforward; you are 
player 1 and you have the option to choose to play against the computer or locally against a friend. We would need to both prompt the user what they want and from that choice, enter into a while loop that would commence until someone has one or we reach a draw. We captured the value of the choice the user enters into the standard input:
```
VS CPU [1] or VS Player [2] or :
```
as the variable ```$choice``` and as long as it is either 1 (playing against CPU) or 2 (playing against a friend), it is valid and kicks off the while loop to start the game.

If you've played Tic-Tac-Toe before, you know there are a few rules. You have to make a move within the designated grid,
you cannot put your piece where another piece already is (yes, even if its your own), and someone either wins if they get 3-in-a-row or there's a draw if the board is all filled up. Now we would just need to broaden that a bit and add a few more edge cases (never trust the user!!!) so that we can have a game that behaves and reacts predictably. 

Since we decided to structure the game so that the user is given second and third and even more chances to input more values, we needed to capture the return value of invalid attempts while still being in the while loop. Within the scope of our ```sub Main``` function, we declared a ```$ret``` variable. If running the function ```MakeMove``` on the user's input returns an invalid value of 0, the output ```Invalid move! Try again.``` would be shown and the game commences with no changes. The user then has a chance to input a valid coordinate.

Once the user has put in a valid coordinate, either the computer or the 2nd player goes next. Earlier, when the variable ```$choice``` was used, that value will determine whether another prompt is given to the players or if the machine will automatically make a move. 


A function was needed to determine where to put the next piece. We did not just want to have the machine put their piece just anywhere. We wanted to give the user a real challenge. The function ```MakeSmartRobotMove``` would prioritize making leeway to win, then obstructing the other user from winning, and then placing a piece in a random spot if neither of the above are the case in that level of importance. 

At this point in the code, either player 2 or the computer has made a move. Each time that the while loop continues and we get back to this point in the code, a check will be made to see if there are any 3-in-a-row connections to determine if there is a winner and to exit the game. A counter is also in place to ensure that if 9 moves have been made and there are no 3-in-a-row connections, then the player can exit out of the loop because the game will end in a draw.

| * \ 
| * \ 
| * \ 
| * \  
| * \ 
|     Insert more text here
| * \
| * \
| * \
| * \
| * \


---
## Conclusion

Our takes on the language and project itself: 

**Ben**: Perl is that wacky uncle.

**Bob**: I found Perl to be very similar to bash scripting in terms of syntax. I was surprised the ways in which we were able to use Perl for this project

**Christine**: Perl is like lit. 

**Kevin**: Learning Perl is exiting! Learning a new programming lang gets easier the more programming languages you discover.

**Kyle**: The data types scare me.

**Raudo**: Perl is kind of cool, not sure if i like it.



While Perl would not have been the first language that comes to mind for us to write a Tic Tac Toe game,
we found that the support of object oriented procedure along with the ease of using text files made this
challenge both simple and powerful. 

If you haven’t coded in Perl before, we encourage you to take this challenge upon yourselves
and maybe even see if you can explore an alternative way that works best for you!




---

## Authors

* **Ben Keener** - [bean710](https://github.com/bean710)
* **Bob Deprizio** - [BD20171998](https://github.com/BD20171998)
* **Christine Pang** - [christinepang1](https://github.com/christinepang1)
* **Kevin Apostol** - [kevapostol](https://github.com/kevapostol)
* **Kyle Campbell** - [waffle52](https://github.com/waffle52)
* **Raudo Paulino** - [RaudoR](https://github.com/RaudoR)
