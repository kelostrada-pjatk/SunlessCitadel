
/* This rule just writes out game instructions. */

instructions :-
	nl,
	write('Enter commands using standard Prolog syntax.'), nl,
	write('Available commands are:'), nl,
	write('start.                   -- to start the game.'), nl,
	write('n.  s.  e.  w.  u.  d.   -- to go in that direction.'), nl,
	write('inventory.               -- to list objects hero is carrying.'), nl,
	write('status.                  -- to see what status hero is in right now.'), nl,
	write('skills.                  -- to list what skills can hero use.'), nl,
	write('take(Object).            -- to pick up an object.'), nl,
	write('drop(Object).            -- to put down an object.'), nl,
	write('use(Object).             -- to manipulate an object.'), nl,
	write('use(Object, Object).     -- to manipulate an object with an object.'), nl,
	write('look.                    -- to look around you again.'), nl,
	write('look(Object).            -- to look at concrete object.'), nl,
	write('instructions.            -- to see this message again.'), nl,
	write('halt.                    -- to end the game and quit.'), nl,
	nl.
		
/* This rule prints out instructions and tells where you are. */

start :-
	instructions,
	look.
		
:- write('========= Welcome to SUNLESS CITADEL. ========='), nl, instructions.