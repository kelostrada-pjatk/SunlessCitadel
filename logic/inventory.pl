/* Rule to display all items currently carried by hero */

inventory :-
	write("Items in inventory:"),
	nl,
	is_in_inventory(X),
	write("- "), title(X), nl,
	fail.
	
/* Rule to check if the object is visible. */

hero_sees(S) :-
	string(S),
	title(X, S),
	hero_sees(X),
	!.

hero_sees(X) :-
	hero_is_at(Place),
	at(X, Place),
	\+ invisible_object(X), !;
	is_in_inventory(X),
	!.
	
/* Rule to drop items from inventory to the ground */

drop(String) :-
	string(String),
	title(X, String),
	drop(X),
	!.

drop(Object) :-
	hero_is_at(Place),
	is_in_inventory(Object),
	retract(is_in_inventory(Object)),
	assert(at(Object, Place)),
	write("Hero dropped "), title(Object), write("."), nl,
	!.
	
drop(_) :-
	write('Hero is not carrying this.'), nl.
	
/* Rule to take items from the ground */

take(String) :-
	string(String),
	title(X, String),
	take(X),
	!.

take(Object) :-
	is_in_inventory(Object),
	write('It is already in inventory.'), nl,
	!.
	
take(Object) :-
	hero_is_at(Place),
	at(Object, Place),
	is_item(Object),
	\+ invisible_object(Object),
	retract(at(Object, Place)),
	assert(is_in_inventory(Object)),
	write("Hero took "), title(Object), write("."), nl,
	!.
	
take(X) :-
	hero_is_at(Place),
	at(X, Place),
	\+ invisible_object(X), 
	write('Hero cannot take it.'), nl,
	!.
	
take(_) :-
	write('Hero cannot see it.'), nl.
	
/* Rule to use items */
		
use(String) :-
	title(X, String),
	use(X),
	!.

/* Use two items in any combination (one of them or both might be strings)  */

use(S1, S2) :-
	title(X, S1),
	\+ title(_, S2),
	use(X, S2), !;
	
	title(Y, S2),
	\+ title(_, S1),
	use(S1, Y), !;
	
	title(X, S1),
	title(Y, S2),
	use(X, Y), 
	!.
	
/* If hero cannot see something */

use(X, _) :-
	p_visible(X), !.
	
use(_, X) :-
	p_visible(X), !.

use(X) :-
	p_visible(X), !.
	
p_visible(X) :-
	\+ hero_sees(X),
	title(X, _),
	write('Hero cannot see '), title(X), write('.'), nl,
	!.
	
use(X, _) :-
	is_item(X),
	\+ is_in_inventory(X),
	use(X),
	!.
	
use(X) :-
	is_item(X),
	\+ is_in_inventory(X),
	write('Hero cannot use '), title(X), write(' when it is laying on the ground. Hero should pick it up first.'),
	nl,
	!.
	
/* Rule to use obstacles to make Hero move */	

use(Obstacle) :-
	blocks(Here, There, Obstacle),
	hero_is_at(Here),
	path(Here, Direction, There),
	open(Obstacle),
	go(Direction),
	!;
	blocks(Here, There, Obstacle),
	path(There, Direction, Here),
	hero_is_at(There),
	open(Obstacle),
	go(Direction),
	!.

/* Concrete usage - I made kinda private methods by prefixing them with "p_" so I can define them in different files */

use(X) :-
	p_use(X),
	!.

use(X, Y) :-
	p_use(X, Y),
	!.
	
use(X, Y) :-
	write('Hero doesn''t know how to use '), title(X), write(' on '), title(Y), write('.'), nl,
	!.  
	
use(_) :-
	write('Hero doesn''t know how to use that.'), nl.
