; Authors: Faran Ahmad, Kartikeya Gupta

(define (domain Far)
(:requirements :typing :adl)

(:types car
	grid
)

(:predicates 	(free ?x - grid)
				(position ?x - car ?y - grid)
				(occupied ?x - car ?y - grid)
				(horizontal ?x - car)
				(vertical ?x - car)
				(neighbourup ?x - grid ?y - grid)
				(neighbourleft ?x - grid ?y - grid)
				(walll ?x - grid)
				(wallb ?x - grid)
)

(:action move_up
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?down - grid)
	:precondition	(and
							(vertical ?x)
							(free ?final)
							(neighbourup ?initial ?final)
							(position ?x ?initial)
							(occupied ?x ?last)
							(or (wallb ?last) (neighbourup ?down ?last))
							(or (free ?down) (wallb ?last))
				  	)	
	:effect (and
					(not(position ?x ?initial))
					(not(occupied ?x ?last))
					(not(free ?final))
					(position ?x ?final)
					(occupied ?x ?final)
					(free ?last)
			)
)

(:action move_down
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?down - grid)
	:precondition	(and
							(vertical ?x)
							(free ?down)
							(neighbourup ?final ?initial)
							(neighbourup ?down ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
					)
	:effect (and
					(not(position ?x ?initial))
					(not(occupied ?x ?initial))
					(not(free ?down))
					(position ?x ?final)
					(occupied ?x ?down)
					(free ?initial)
			)
)

(:action move_left
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?right - grid)
	:precondition	(and
							(free ?final)
							(horizontal ?x)
							(neighbourleft ?initial ?final)
							(position ?x ?initial)
							(occupied ?x ?last)
							(or (walll ?last) (neighbourleft ?right ?last))
							(or (free ?right) (walll ?last)) 
				  	)	
	:effect (and
					(not(position ?x ?initial))
					(not(occupied ?x ?last))
					(not(free ?final))
					(position ?x ?final)
					(occupied ?x ?final)
					(free ?last)
			)

)

(:action move_right
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?right - grid)
	:precondition	(and
							(free ?right)
							(horizontal ?x)
							(neighbourleft ?final ?initial)
							(neighbourleft ?right ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
					)
	:effect (and
					(not(position ?x ?initial))
					(not(occupied ?x ?initial))
					(not(free ?right))
					(position ?x ?final)
					(occupied ?x ?right)
					(free ?initial)
			)
))

