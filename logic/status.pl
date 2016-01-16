/* Rules to define hero status */

:- dynamic max_health/1, hero_health/1, hero_level/1, hero_experience/1, next_level_experience/1.

health_dice_per_level(10).
max_health(10).
hero_health(10).
hero_level(1).
hero_experience(0).
next_level_experience(1000).

status :-
	hero_health(Health),
	max_health(MaxHealth),
	hero_level(Level),
	hero_experience(Experience),
	next_level_experience(NextLevelExperience),
	write('Health: '), write(Health), write('/'), write(MaxHealth), nl,
	write('Level: '), write(Level), nl,
	write('Experience: '), write(Experience), write('/'), write(NextLevelExperience), nl,
	nl.
	
gain_experience(XP) :-
	hero_experience(OldXP),
	Sum is OldXP+XP,
	
	retract(hero_experience(OldXP)),
	assert(hero_experience(Sum)),
	level_up,
	!.
	
level_up :-
	hero_experience(XP),
	next_level_experience(NextXP),
	hero_level(Level),
	next_level_experience(NextLevelExperience),
	
	NextLevel is Level+1,
	NewNextLevelExperience is NextLevel*1000+NextLevelExperience,
	XP >= NextXP,
	
	retract(hero_level(Level)),
	assert(hero_level(NextLevel)),
	retract(next_level_experience(NextLevelExperience)),
	assert(next_level_experience(NewNextLevelExperience)),
	
	write('Leveled up! New Level: '), write(NextLevel), nl,
	get_health,
	!.
	
get_health :-
	health_dice_per_level(Dice),
	random_between(5, Dice, HP),
	max_health(MaxHP),
	hero_health(CurrentHP),
	
	NewMaxHP is MaxHP + HP,
	NewHP is CurrentHP + HP,
	
	retract(max_health(MaxHP)),
	retract(hero_health(CurrentHP)),
	assert(max_health(NewMaxHP)),
	assert(hero_health(NewHP)),
	
	write('Gained '), write(HP), write('HP'), nl,
	!.
	
get_damaged(Dmg) :-
	Dmg > 0,
	hero_health(HP),
	NewHP is HP-Dmg,
	retract(hero_health(HP)),
	assert(hero_health(NewHP)).
	
get_healed(Health) :-
	Health > 0,
	hero_health(HP),
	max_health(MaxHP),
	NewHP is HP+Health,
	retract(hero_health(HP)),
	(NewHP > MaxHP -> 
		assert(hero_health(MaxHP)) ; 
		assert(hero_health(NewHP))).


