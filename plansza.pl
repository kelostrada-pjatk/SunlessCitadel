:- module(plansza,[]).

:- dynamic at/2, hero_is_at/1, i_am_holding/1, alive/1,
           lit/1, visible_object/1.

hero_is_at(room0).

path(room0, d, room1).
path(room1, u, room0).
path(room1, d, room2).
path(room2, u, room1).