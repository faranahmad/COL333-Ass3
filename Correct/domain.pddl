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
							(occupied ?x ?last)
							(position ?x ?initial)
							(neighbourup ?initial ?final)
							(or (wallb ?last) (neighbourup ?down ?last))
							(or (free ?down) (wallb ?last))
							(free ?final)
							(vertical ?x)
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
							(occupied ?x ?last)
							(position ?x ?initial)
							(neighbourup ?down ?last)
							(neighbourup ?final ?initial)
							(vertical ?x)
							(free ?down)
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
							(occupied ?x ?last)
							(position ?x ?initial)
							(horizontal ?x)
							(neighbourleft ?initial ?final)
							(or (walll ?last) (neighbourleft ?right ?last))
							(or (free ?right) (walll ?last)) 
							(free ?final)
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
							(occupied ?x ?last)
							(position ?x ?initial)
							(horizontal ?x)
							(neighbourleft ?final ?initial)
							(neighbourleft ?right ?last)
							(free ?right)
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

