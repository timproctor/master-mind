Mastermind game is based on the original board game.

Some features of this CLI game are:

- Allowing user to quit with 'q' command at any point in the game.

- When user finds the correct secret code, game will provide the
  total number of guesses that it took user along with total time
  in minutes and seconds.

- Game gives user chance to play game again, re-setting previous
  game guesses and times.

- Game asks user twice if they want to (q)uit or (p)lay if user inputs
  that they want to quit with 'q'.

- User may input absolute garbage like '12    R  ****   B' and game
  will parse out any characters that are usable. In the above
  example, the game will save the 'r' and 'b' but still give a message
  to the user that their guess is too short or too long.

- Making a garbage guess will not add to guesses or time.

- CodeGenerator is geared up to access different levels of play but was
  not implemented at this time.
