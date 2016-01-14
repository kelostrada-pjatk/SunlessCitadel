:- discontiguous title/1.
:- discontiguous describe/1.
:- discontiguous plural/1.

/* Rules to describe items */

plural(bones).
title(bones) :-
	write('Bones').
describe(bones) :-
	write('Just old plain bones.'), nl.
	
title(ring_of_stones) :-
	write('Ring of Stones').
describe(ring_of_stones) :-
	write('An old ring of stones that contains (and is covered by) the accumulated ash of hundreds of fires, though no fire has been lit here for a few years'), nl.