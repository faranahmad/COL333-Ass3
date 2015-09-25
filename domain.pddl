; Authors: Faran Ahmad, Kartikeya Gupta

(define (domain Kar))
(:requirements :adl)

(:types car
	grid
)

(:predicates 	(free ?x - grid)
				(occupied ?x - car ?y - grid)
				(notfree ?x - grid)
				(isinbetween ?init - grid ?mid - grid ?final - grid)
				(horizontal ?x - car)
				(vertical ?x - car)
				(maplength ?x - car ?y - length)
)

(:action move_up 
	:parameters (?x - car ?initial -grid ?final - grid)
	:precondition (and((free ?final) 
						(forall (?midpos - grid) (imply (isinbetween(?final ?midpos ?initial)) (free ?midpos)) )
						(vertical ?x)) 
				)
	:


(:predicates 	(free ?x - grid)
				(position ?x - car ?y - grid)
				(occupied ?x - car ?y - grid)
				(horizontal ?x - car)
				(vertical ?x - car)
				(neighbourup ?x - grid ?y - grid)
				(neighbourright ?x - grid ?y - grid)
)

(:action move_up
	:parameters (?x - car ?inital - grid ?final - grid ?up - grid ?last - grid)
	:precondition (and((free ?final)
						(neighbourup ?initial ?final)
						(neighbourup ?last ?up)
						(position ?x ?initial)
						(occupied ?x ?last)
						(occupied ?x ?up)
						(horizontal ?x)
						)
					)
	:effect (and((position ?x ?final)
					(not(position ?x ?initial))
					(occupied ?x ?final)
					(not(occupied ?x ?last))
					(free ?last)
			)


	)
)