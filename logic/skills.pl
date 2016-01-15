/* Rule to display available skills */

skills :-
	write('search.                 -- to search the place hero is standing.'),
	nl.
	
/* Concrete skills */

search :-
	\+ invisible_object(_),
	write('Hero noticed nothing special about this place.'),
	nl.
	
search :-
	hero_is_at(Place),
	invisible_object(X),
	at(X, Place),
	make_visible(X),
	write('Hero noticed '), title(X), write('!'), nl,
	fail.
