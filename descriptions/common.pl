
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