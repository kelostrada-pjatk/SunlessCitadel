/* Rule to display all items currently carried by hero */

inventory :-
	write("Items in inventory:"),
	nl,
	is_in_inventory(X),
	write("- "), title(X), nl,
	fail.