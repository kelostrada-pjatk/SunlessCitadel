:- dynamic at/2.

/*
is_item				- Rule define objects which can be carried by hero
is_environement		- Rule define objects which are environement (cannot be moved)
*/

/* Room1 starting objects */
is_item(bones).
at(bones, room1).

is_environement(ring_of_stones).
at(ring_of_stones, room1).
