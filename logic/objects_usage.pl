
p_use(rope, pillars) :-
	is_in_inventory(rope),
	retract(is_in_inventory(rope)),
	assert(at(hanging_rope, room0)),
	assert(at(hanging_rope, room1)),
	write('Hero hung the rope to the pillars.'),
	nl,
	!.
	
p_use(hanging_rope) :-
	write('Hero is climbing down using the rope...'), nl, nl,
	\+ open(hanging_rope),
	assert(open(hanging_rope)),
	use(hanging_rope),
	nl,
	!.

p_use(rope) :-
	write('Hero doesn''t know what exactly to do with the rope so he starts using it like a hanging rope.'), nl,
    write('  _____.------[_]'), nl,
    write(' +------------|x|'), nl,
    write(' |            |x|'), nl,
    write(' |            |x|'), nl,
    write(' |            |x|'), nl,
    write(' |            |x|'), nl,
    write(' j            |x|'), nl,
    write(''' \\/\\_        |X|'), nl,
    write('  (           |X|'), nl,
    write(' (o)          |X|'), nl,
    write('              |X|'), nl,
    write('    \\         FXJ'), nl,
    write('     z!      J>X<L'), nl,
    write('            /_>x<_\\'), nl,
    write('           []     []'), nl,
	!.