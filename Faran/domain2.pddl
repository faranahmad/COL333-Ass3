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
)

(:action move_up
	:parameters (?x - car ?init ?fin ?end ?belowend - grid)
	:precondition (and
					(free ?fin)
					(position ?x ?init)
					(occupied ?x ?end)
					(free ?belowend)
					(neighbourup ?init ?fin)
					(neighbourup ?belowend ?end)
		)
	:effect (and
				(not(free ?fin))
				(position ?x ?fin)
				(not(position ?x ?init))
				(occupeid ?x ?fin)
				(free ?end)
				(not(occupied ?x ?end))
		)
)

(:action move_down
	:parameters (?x - car ?init ?fin ?end ?belowend - grid)
	:precondition (and
					(free ?fin)
					(position ?x ?init)
					(occupied ?x ?end)
					(free ?belowend)
					(neighbourup ?init ?fin)
					(neighbourup ?belowend ?end)
		)
	:effect (and
				(not(free ?fin))
				(position ?x ?fin)
				(not(position ?x ?init))
				(occupeid ?x ?fin)
				(free ?end)
				(not(occupied ?x ?end))
		)
)





(:action move_up
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?down - grid)
	:precondition	(and
							(free ?final)
							(neighbourup ?initial ?final)
							(neighbourup ?down ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
							(free ?down)
							(vertical ?x)
						
				  	)	
	:effect (and
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?final)
					(not(occupied ?x ?last))
					(free ?last)
					(not(free ?final))
			)
)

(:action move_down
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?down - grid)
	:precondition	(and
							(free ?down)
							(neighbourup ?final ?initial)
							(neighbourup ?down ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
							(vertical ?x)
						
					)
	:effect (and
					(position ?x ?final)
					(not(position ?x ?initial))
					(not(occupied ?x ?initial))
					(occupied ?x ?down)
					(not(free ?down))
					(free ?initial)
			)
)

(:action move_left
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?right - grid)
	:precondition	(and
							(free ?final)
							(free ?right)
							(neighbourleft ?initial ?final)
							(neighbourleft ?right ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
							(horizontal ?x)
				  	)	
	:effect (and
					(position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?final)
					(not(occupied ?x ?last))
					(free ?last)
					(not(free ?final))
			)

)

(:action move_right
	:parameters (?x - car ?initial - grid ?final - grid ?last - grid ?right - grid)
	:precondition	(and
							(free ?right)
							(neighbourleft ?final ?initial)
							(neighbourleft ?right ?last)
							(position ?x ?initial)
							(occupied ?x ?last)
							(horizontal ?x)
					)
	:effect (and
					(position ?x ?final)
					(not(position ?x ?initial))
					(not(occupied ?x ?initial))
					(occupied ?x ?right)
					(free ?initial)
					(not(free ?right))
			)
))

