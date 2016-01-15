/* Rule to write title of anything */

title(X) :-
	title(X, Title),
	write(Title).
	
describe(X) :-
	description(X, Description),
	write(Description),
	nl.

/* This rule tells how to look about you. */

look :-
	hero_is_at(Place),
	describe(Place),
	nl,
	notice_objects_at(Place),
	nl.

/* This rules tells how to look at objects by specifying their title */
	
look(String) :-
	string(String),
	title(Object, String),
	look(Object).

/* This rule tells how to look at objects placed in a room hero is standing */

look(Object) :-
	hero_is_at(Place),
	at(Object, Place),
	describe(Object),
	nl.
	
/* This rule tells how to look at objects placed in heros inventory */

look(Object) :-
	is_in_inventory(Object),
	describe(Object),
	nl.
		
look(_) :-
	write('You can''t see that.'),
	nl.
/* This rule makes invisible objects visible. It is used for instance for hidden doors */
	
make_visible(X) :-
	\+ invisible_object(X).

make_visible(X) :-
	retract(invisible_object(X)).

/* These rules set up a loop to mention all the objects in your vicinity. */

notice_objects_at(Place) :-
	at(X, Place),
	\+ invisible_object(X),
	plural(X),
	write('There are '), title(X), write(' here.'), nl,
	fail.
	
notice_objects_at(Place) :-
	at(X, Place),
	\+ invisible_object(X),
	\+ plural(X),
	write('There is a '), title(X), write(' here.'), nl,
	fail.

notice_objects_at(_).