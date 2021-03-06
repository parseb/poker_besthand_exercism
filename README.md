# Poker Hand Ranking :spades: :hearts: :diamonds: :clubs:  

This solution aims to rank hands by a proxy score so that:

- A higher order class hand will always have a higher score than a lower order one.  
 	ex: 9H 3D 9D 8C 7H (pair) < 2H 3H 4H 5H 6H (straight flush) 

- Hands belonging to the same class are differantiated based on face value (kicker or highest card)

Features:
- Context agnostic when calculating score.
- Takes an unlimited number of hands as input.


__________
Pick the best hand(s) from a list of poker hands.

See [wikipedia](https://en.wikipedia.org/wiki/List_of_poker_hands) for an
overview of poker hands.

* * * *

For installation and learning resources, refer to the
[Ruby resources page](http://exercism.io/languages/ruby/resources).

For running the tests provided, you will need the Minitest gem. Open a
terminal window and run the following command to install minitest:

    gem install minitest

If you would like color output, you can `require 'minitest/pride'` in
the test file, or note the alternative instruction, below, for running
the test file.

Run the tests from the exercise directory using the following command:

    ruby poker_test.rb

To include color from the command line:

    ruby -r minitest/pride poker_test.rb


## Source

Inspired by the training course from Udacity. [https://www.udacity.com/course/viewer#!/c-cs212/](https://www.udacity.com/course/viewer#!/c-cs212/)

## Submitting Incomplete Solutions
It's possible to submit an incomplete solution so you can see how others have completed the exercise.
