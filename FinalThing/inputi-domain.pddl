(define (domain Far)
(:requirements :typing :adl)
(:types car grid )
(:predicates (free ?x - grid)
 (position ?x - car ?y - grid ?z - grid)
 (horizontal ?x - car)
 (vertical ?x - car)
 (neighbourup ?x - grid ?y - grid)
 (neighbourleft ?x - grid ?y - grid))
(:action move_up2_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?internal1 ?internal0)
 (free ?external0))
:effect (and 
 (free ?internal1 )
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external0 ?internal0))
)
(:action move_up2_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?external0 ?external1)
 (neighbourup ?internal1 ?internal0)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external1 ?external0))
)
(:action move_up2_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?external0 ?external1)
 (neighbourup ?external1 ?external2)
 (neighbourup ?internal1 ?internal0)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external2))
 (not(free ?external1))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external2 ?external1))
)
(:action move_up2_4
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid ?external3 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?external0 ?external1)
 (neighbourup ?external1 ?external2)
 (neighbourup ?external2 ?external3)
 (neighbourup ?internal1 ?internal0)
 (free ?external0)
 (free ?external1)
 (free ?external2)
 (free ?external3))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external3))
 (not(free ?external2))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external3 ?external2))
)
(:action move_up3_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?internal1 ?internal0)
 (neighbourup ?internal2 ?internal1)
 (free ?external0))
:effect (and 
 (free ?internal2 )
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external0 ?internal1))
)
(:action move_up3_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?external0 ?external1)
 (neighbourup ?internal1 ?internal0)
 (neighbourup ?internal2 ?internal1)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external1 ?internal0))
)
(:action move_up3_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourup ?internal0 ?external0)
 (neighbourup ?external0 ?external1)
 (neighbourup ?external1 ?external2)
 (neighbourup ?internal1 ?internal0)
 (neighbourup ?internal2 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external2))
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external2 ?external0))
)
(:action move_down2_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?internal0 ?internal1)
 (free ?external0))
:effect (and 
 (free ?internal1 )
 (not(free ?external0))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?internal0 ?external0))
)
(:action move_down2_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?external1 ?external0)
 (neighbourup ?internal0 ?internal1)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external0 ?external1))
)
(:action move_down2_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?external1 ?external0)
 (neighbourup ?external2 ?external1)
 (neighbourup ?internal0 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external2))
 (not(free ?external1))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external1 ?external2))
)
(:action move_down2_4
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid ?external3 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?external1 ?external0)
 (neighbourup ?external2 ?external1)
 (neighbourup ?external3 ?external2)
 (neighbourup ?internal0 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2)
 (free ?external3))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external3))
 (not(free ?external2))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external2 ?external3))
)
(:action move_down3_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?internal0 ?internal1)
 (neighbourup ?internal1 ?internal2)
 (free ?external0))
:effect (and 
 (free ?internal2 )
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?internal1 ?external0))
)
(:action move_down3_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?external1 ?external0)
 (neighbourup ?internal0 ?internal1)
 (neighbourup ?internal1 ?internal2)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?internal0 ?external1))
)
(:action move_down3_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (vertical ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourup ?external0 ?internal0)
 (neighbourup ?external1 ?external0)
 (neighbourup ?external2 ?external1)
 (neighbourup ?internal0 ?internal1)
 (neighbourup ?internal1 ?internal2)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external2))
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?external0 ?external2))
)
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
(:action move_left2_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?external0 ?external1)
 (neighbourleft ?internal1 ?internal0)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external1 ?external0))
)
(:action move_left2_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?external0 ?external1)
 (neighbourleft ?external1 ?external2)
 (neighbourleft ?internal1 ?internal0)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external2))
 (not(free ?external1))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external2 ?external1))
)
(:action move_left2_4
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid ?external3 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal1)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?external0 ?external1)
 (neighbourleft ?external1 ?external2)
 (neighbourleft ?external2 ?external3)
 (neighbourleft ?internal1 ?internal0)
 (free ?external0)
 (free ?external1)
 (free ?external2)
 (free ?external3))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external3))
 (not(free ?external2))
 (not(position ?x ?internal0 ?internal1))
 (position ?x ?external3 ?external2))
)
(:action move_left3_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?internal1 ?internal0)
 (neighbourleft ?internal2 ?internal1)
 (free ?external0))
:effect (and 
 (free ?internal2 )
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external0 ?internal1))
)
(:action move_left3_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?external0 ?external1)
 (neighbourleft ?internal1 ?internal0)
 (neighbourleft ?internal2 ?internal1)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external1 ?internal0))
)
(:action move_left3_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal0 ?internal2)
 (neighbourleft ?internal0 ?external0)
 (neighbourleft ?external0 ?external1)
 (neighbourleft ?external1 ?external2)
 (neighbourleft ?internal1 ?internal0)
 (neighbourleft ?internal2 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external2))
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal0 ?internal2))
 (position ?x ?external2 ?external0))
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
(:action move_right2_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?external1 ?external0)
 (neighbourleft ?internal0 ?internal1)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external0 ?external1))
)
(:action move_right2_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?external1 ?external0)
 (neighbourleft ?external2 ?external1)
 (neighbourleft ?internal0 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external2))
 (not(free ?external1))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external1 ?external2))
)
(:action move_right2_4
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?external0 - grid ?external1 - grid ?external2 - grid ?external3 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal1 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?external1 ?external0)
 (neighbourleft ?external2 ?external1)
 (neighbourleft ?external3 ?external2)
 (neighbourleft ?internal0 ?internal1)
 (free ?external0)
 (free ?external1)
 (free ?external2)
 (free ?external3))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (not(free ?external3))
 (not(free ?external2))
 (not(position ?x ?internal1 ?internal0 ))
 (position ?x  ?external2 ?external3))
)
(:action move_right3_1
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?internal0 ?internal1)
 (neighbourleft ?internal1 ?internal2)
 (free ?external0))
:effect (and 
 (free ?internal2 )
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?internal1 ?external0))
)
(:action move_right3_2
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?external1 ?external0)
 (neighbourleft ?internal0 ?internal1)
 (neighbourleft ?internal1 ?internal2)
 (free ?external0)
 (free ?external1))
:effect (and 
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?internal0 ?external1))
)
(:action move_right3_3
:parameters (?x - car ?internal0 - grid ?internal1 - grid ?internal2 - grid ?external0 - grid ?external1 - grid ?external2 - grid )
:precondition (and 
 (horizontal ?x) 
 (position ?x ?internal2 ?internal0 )
 (neighbourleft ?external0 ?internal0)
 (neighbourleft ?external1 ?external0)
 (neighbourleft ?external2 ?external1)
 (neighbourleft ?internal0 ?internal1)
 (neighbourleft ?internal1 ?internal2)
 (free ?external0)
 (free ?external1)
 (free ?external2))
:effect (and 
 (free ?internal0 )
 (free ?internal1 )
 (free ?internal2 )
 (not(free ?external2))
 (not(free ?external1))
 (not(free ?external0))
 (not(position ?x ?internal2 ?internal0 ))
 (position ?x  ?external0 ?external2))
)
)