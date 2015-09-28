; Authors: Faran Ahmad, Kartikeya Gupta

(define (domain Far)

(:predicates 	(free ?x)
				(position ?x ?y)
				(occupied ?x ?y)
				(horizontal ?x)
				(vertical ?x)
				(neighbourup ?x ?y)
				(neighbourleft ?x ?y)
				(walll ?x)
				(wallb ?x)
)

(:action move_up
	:parameters (?x ?initial ?final ?last ?down)
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
	:parameters (?x ?initial ?final ?last ?down)
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
	:parameters (?x ?initial ?final ?last ?right)
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
	:parameters (?x ?initial ?final ?last ?right)
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

