(define (domain Far)
(:requirements :typing :adl)
(:types car grid )
(:predicates (free ?x - grid)
 (position ?x - car ?y - grid ?z - grid)
 (horizontal ?x - car)
 (vertical ?x - car)
 (neighbourup ?x - grid ?y - grid)
 (neighbourleft ?x - grid ?y - grid))


(:action move_left2_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?internal1 ?internal0)
 (free ?external0))
:effect (and 
 (free ?internal1 )
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external0 ?internal0))
)
(:action move_right2_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?internal0 ?internal1)
 (free ?external0))
:effect (and 
 (free ?internal1 )
 (not(free ?external0))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?internal0 ?external0))
)
)