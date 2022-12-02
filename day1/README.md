## Day 1

How to run: install opam and dune, go into the p1, or p2 folders and run `dune exec ./pX.exe` where X is either 1 or 2 the only dependency is `str` for some reason this is a dependency I needed a dunefile for not sure why ocaml is kinda scuffed and doesn't have this sort of stuff built in.

## Solutions

In part 1 I just split on "\n\n" then on "\n" casting each of those numbers to an int, this is the parsing used between both solutions.

In part 1 scuff asf bc for some reason ocaml has no sum or max functions built in? like where is `List.sum` or `List.max` pretty cringe ngl someone plz add

In part 2 I can't sort using something like `(>)` which p cringe asf, gotta write a java compare function, big L, why is there no fkin `~rev:true` option again plz add someone wtf why this not in the game.

I then use op `::` function to take the top 3 elements and sum them p big brain honestly.
