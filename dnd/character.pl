/* First attempt to make some structural character data */

make_character(Health, Strength, Armor, character(Health, Strength, Armor)).

get_health(character(Health,_,_), Health).
get_strength(character(_,Strength,_), Strength).
get_armor(character(_,_,Armor), Armor).

