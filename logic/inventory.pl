/* Rule to display all items currently carried by hero */

inventory :-
	write("Items in inventory:"),
	nl,
	is_in_inventory(X),
	write("- "), title(X), nl,
	fail.
	
/* Rule to drop items from inventory to the ground */

drop(String) :-
	string(String),
	title(X, String),
	drop(X).

drop(Object) :-
	hero_is_at(Place),
	is_in_inventory(Object),
	retract(is_in_inventory(Object)),
	assert(at(Object, Place)),
	write("Hero dropped "), title(Object), write("."), nl.
	
drop(_) :-
	write('Hero is not carrying this.'), nl.
	
/* Rule to take items from the ground */

take(String) :-
	string(String),
	title(X, String),
	take(X).

take(Object) :-
	is_in_inventory(Object),
	write('It is already in inventory.'),
	nl.
	
take(Object) :-
	hero_is_at(Place),
	at(Object, Place),
	is_item(Object),
	retract(at(Object, Place)),
	assert(is_in_inventory(Object)),
	write("Hero took "), title(Object), write("."), nl.
	
take(_) :-
	write('Hero cannot take it.'), nl.
	
/* Rule to use items */

use(String) :-
	title(X, String),
	use(X).

use(_) :-
	write('Hero doesn''t know how to use that.'), nl.