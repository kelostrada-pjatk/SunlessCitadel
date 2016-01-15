
hero_is_at(room0).

/* These rules define the six direction letters as calls to go/1. */

n :- go(n), !.
s :- go(s), !.
e :- go(e), !.
w :- go(w), !.
u :- go(u), !.
d :- go(d), !.

/* This rule tells how to move in a given direction. */

go(Direction) :-
	hero_is_at(Here),
	path(Here, Direction, There),
	retract(hero_is_at(Here)),
	assert(hero_is_at(There)),
	look.
	
go(_) :-
	write('You can''t go that way.').