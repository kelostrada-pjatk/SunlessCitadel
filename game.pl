:- dynamic hero_is_at/1, at/2.

hero_is_at(room0).

/* These rules define the six direction letters as calls to go/1. */

n :- go(n).
s :- go(s).
e :- go(e).
w :- go(w).
u :- go(u).
d :- go(d).

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
	
/* These rules set up a loop to mention all the objects in your vicinity. */

notice_objects_at(Place) :-
	at(X, Place),
	visible_object(X),
	write('There is a '), write(X), write(' here.'), nl,
	fail.

notice_objects_at(_).

make_visible(X) :-
	visible_object(X).

make_visible(X) :-
	assert(visible_object(X)).