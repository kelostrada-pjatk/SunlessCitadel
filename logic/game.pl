
hero_is_at(room0).

/* These rules define the six direction letters as calls to go/1. */

n :- go(n).
s :- go(s).
e :- go(e).
w :- go(w).
u :- go(u).
d :- go(d).

/* This rule just writes out game instructions. */

instructions :-
	nl,
	write('Enter commands using standard Prolog syntax.'), nl,
	write('Available commands are:'), nl,
	write('start.                   -- to start the game.'), nl,
	write('n.  s.  e.  w.  u.  d.   -- to go in that direction.'), nl,
	write('take(Object).            -- to pick up an object.'), nl,
	write('drop(Object).            -- to put down an object.'), nl,
	write('use(Object).             -- to manipulate an object.'), nl,
	write('look.                    -- to look around you again.'), nl,
	write('instructions.            -- to see this message again.'), nl,
	write('halt.                    -- to end the game and quit.'), nl,
	nl.
		
/* This rule prints out instructions and tells where you are. */

start :-
	instructions,
	look.


/* This rule tells how to move in a given direction. */

go(Direction) :-
	hero_is_at(Here),
	path(Here, Direction, There),
	retract(hero_is_at(Here)),
	assert(hero_is_at(There)),
	look.
	
go(_) :-
	write('You can''t go that way.').
	
/* This rule tells how to look about you. */

look :-
	hero_is_at(Place),
	describe(Place),
	nl,
	notice_objects_at(Place),
	nl.

make_visible(X) :-
	\+ invisible_object(X).

make_visible(X) :-
	retract(invisible_object(X)).
	
:- write('========= Welcome to SUNLESS CITADEL. ========='), nl, instructions.