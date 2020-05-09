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

List of files:
CheckSetPlayer.pl 
CheckSetRobot.pl 
Check_cols.pl 
Check_diag.pl 
Check_rows.pl 
MakeMove.pl 
MakeRobotMove.pl 
MakeSmartMove.pl 
Print_grid.pl
compile.sh 
ttt.pl 

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

Ben: Perl is that wacky uncle.

Bob: I found Perl to be very similar to bash scripting in terms of syntax. I was surprised the ways in which we were able to use Perl for this project

Christine: Perl is like lit. 

Kevin: Learning Perl is exiting! Learning a new programming lang gets easier the more programming languages you discover.

Kyle: The data types scare me.

Raudo: Perl is kind of cool, not sure if i like it.



While Perl would not have been the first language that comes to mind for us to write a tic tac toe game,
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
