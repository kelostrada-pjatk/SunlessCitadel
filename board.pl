:- dynamic at/2, hero_is_at/1, i_am_holding/1, alive/1,
           lit/1, visible_object/1.
           
/*
    n
  w   e
    s
*/

hero_is_at(room0).

path(room0, d, room1).
path(room1, u, room0).
path(room1, d, room2).
path(room2, u, room1).
path(room2, d, room3).
path(room3, u, room2).
path(room3, w, room4).
path(room4, e, room3).
path(room4, s, room5).
path(room5, n, room4).
path(room4, s, room6).
path(room6, n, room4).
path(room4, n, room13a).
path(room13a, e, room4).
path(room6, w, room7).
path(room7, e, room6).
path(room7, w, room8).
path(room8, e, room7).
path(room8, w, room9).
path(room9, e, room8).
path(room9, w, room10).
path(room10, e, room9).
path(room10, s, room11).
path(room11, n, room10).
path(room11, w, room12).
path(room12, s, room11).
path(room13a, s, room14).
path(room14, n, room13a).
path(room13a, n, room13b).
path(room13b, s, room13a).
path(room13a, w, room15b).
path(room15b, e, room13a).
path(room15b, s, room17).
path(room17, n, room15b).
path(room15b, w, room13c).
path(room13c, e, room15b).
path(room15b, n, room15a).
path(room15a, s, room15b).
path(room15b, w, room15c).
path(room15c, e, room15b).
path(room15a, w, room16a).
path(room16a, e, room15a).

/*
    n
  w   e
    s
*/
