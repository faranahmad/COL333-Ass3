; Authors: Faran Ahmad, Kartikeya Gupta

(define (domain Far)
(:requirements :adl)

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
)

(:action move_up
	:parameters (?x - car ?inital - grid ?final - grid ?up - grid ?last - grid)
	:precondition	(and(
							(free ?final)
							(neighbourup ?initial ?final)
							(neighbourup ?last ?up)
							(position ?x ?initial)
							(occupied ?x ?last)
							(occupied ?x ?up)
							(vertical ?x)
						)
				  	)	
	:effect (and(
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?final)
					(not(occupied ?x ?last))
					(free ?last)
				)


			)
)

(:action move_down
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?down - grid)
	:precondition	(and(
							(free ?down)
							(neighbourup ?initial ?final)
							(neighbourup ?down ?last)
							(position ?x ?initial)
							(ocuupied ?x ?last)
							(vertical ?x)
						)
					)
	:effect (and(
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?down)
					(free ?initial)

				)
			)
)

(:action move_left
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?left - grid)
	:precondition	(and(
							(free ?final)
							(neighbourleft ?initial ?final)
							(neighbourleft ?last ?up)
							(position ?x ?initial)
							(occupied ?x ?last)
							(occupied ?x ?left)
							(horizontal ?x)
						)
				  	)	
	:effect (and(
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?final)
					(not(occupied ?x ?last))
					(free ?last)
				)


			)

)

(:action move_right
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?right - grid)
	:precondition	(and(
							(free ?right)
							(neighbourup ?initial ?final)
							(neighbourup ?right ?last)
							(position ?x ?initial)
							(ocuupied ?x ?last)
							(vertical ?x)
						)
					)
	:effect (and(
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?right)
					(free ?initial)

				)
			)
))

