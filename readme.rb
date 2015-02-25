Mastermind
In this project you’ll use Ruby to build an implementation of the classic game Mastermind.

Introduction

Learning Goals / Areas of Focus

Proficiently use TDD to drive development
Practice breaking a program into logical components
Learn to implement a REPL interface
Apply previously learned Enumerable techniques in a real context
Base Expectations

Use this repository as a template for your project.

You are to build a playable game of Mastermind that runs in a REPL interface.

Starting a Game

The player starts the game by running ruby mastermind.rb
Then they see:
Welcome to MASTERMIND
Would you like to (p)lay, read the (i)nstructions, or (q)uit?
>
If they enter p or play then they enter the game flow described below.
If they enter i or instructions they should be presented with a short explanation of how the game is played.
If they enter q or quit then the game should exit
Game Flow

Once the user starts a game they should see:
I have generated a beginner sequence with four elements made up of: (r)ed,
(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
What's your guess?
They can then enter a guess in the form rrgb

Guesses are case insensitive
If it’s 'q' or 'quit' then exit the game
If it’s 'c' or 'cheat' then print out the current secret code
If it’s fewer than four letters, tell them it’s too short
If it’s longer than four letters, tell them it’s too long
If they guess the secret sequence, enter the end game flow below
Otherwise give them feedback on the guess like this:
close  minimize  deactivate
IRB


'RRGB' has 3 of the correct elements with 2 in the correct positions
You've taken 1 guess
Then let them guess again, repeating the game flow loop.

End Game

When the user correctly guesses the sequence, output the following:
Congratulations! You guessed the sequence 'GRRB' in 8 guesses over 4 minutes,
22 seconds.
Do you want to (p)lay again or (q)uit?
If they enter 'p' or 'play' then restart the game. 'q' or 'quit' ends the game.
