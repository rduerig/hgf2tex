hgf2tex
=======

Copyright (c) 2013 Ralph Dürig (ralphduerig@googlemail.com)

Many many thanky goes to Marcin Ciura for creating havannah.sty!
It's included it in this project because it's used in the latex code hgf2tex throws out.


Short Explanation:
------------------

Converts hgf files (moves and size) to a latex snippet that can be included in documents. Requires the included latex package.


Long Explanation:
-----------------

This simple ruby script parses hgf files or rather Havannah game files.
Such files can be found on http://littlegolem.net for instance and contain all relecant information to reconstruct or to typeset a game.
Therefore it parses the board size and the list of moves that where made and prints a corresponding latex snippet to the console.
That's not very comfortable, don't ask, I'm aware of it.
Note that this script is ratherly intended for adapting it to your individual needs instead of using it blindly.
