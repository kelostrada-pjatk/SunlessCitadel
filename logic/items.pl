
/*
is_item				-- Rule defines objects which can be carried by hero
is_environement		-- Rule defines objects which are environement (cannot be moved)
is_in_inventory		-- Rule defines objects which are in heros inventory
*/

/* Inventory starting objects */

is_item(rope).
is_in_inventory(rope).

/* Room1 starting objects */
is_item(bones).
at(bones, room1).

is_environement(ring_of_stones).
at(ring_of_stones, room1).