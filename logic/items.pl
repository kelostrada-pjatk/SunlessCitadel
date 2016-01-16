/*
is_item				-- Rule defines objects which can be carried by hero
is_environement		-- Rule defines objects which are environement (cannot be moved)
is_in_inventory		-- Rule defines objects which are in heros inventory
*/

/* Inventory starting objects */



/* Room0 starting objects */

is_item(rope).
at(rope, room0).
invisible_object(rope).

is_environement(pillars).
at(pillars, room0).
invisible_object(pillars).

is_environement(ravine).
at(ravine, room0).

/* Room1 starting objects */
is_item(bones).
at(bones, room1).

is_environement(ring_of_stones).
at(ring_of_stones, room1).

is_environement(hanging_rope).
