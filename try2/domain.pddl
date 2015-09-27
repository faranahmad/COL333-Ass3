; Authors: Faran Ahmad, Kartikeya Gupta

(define (domain Far)
(:requirements :typing :adl)

(:types car
	grid
)

(:predicates 	(free ?x - grid)
				(position ?x - car ?y - grid ?z - grid)
				(horizontal ?x - car)
				(vertical ?x - car)
				(neighbourup ?x - grid ?y - grid)
				(neighbourleft ?x - grid ?y - grid)
)

(:action move_up
	:parameters (?x - car ?initials - grid ?initiale - grid ?finals - grid ?finale - grid)
	:precondition	(and
							(position ?x ?initials ?initiale)
							(neighbourup ?initials ?finals)
							(neighbourup ?initiale ?finale)
							(free ?finals)
							(vertical ?x)
				  	)	
	:effect (and
					(not(position ?x ?initials ?initiale))
					(not(free ?finals))
					(position ?x ?finals ?finale)
					(free ?initiale)
			)
)

(:action move_down
	:parameters (?x - car ?initials - grid ?initiale - grid ?finals - grid ?finale - grid)
	:precondition	(and
							(position ?x ?initials ?initiale)
							(neighbourup ?finals ?initials)
							(neighbourup ?finale ?initiale)
							(free ?finale)
							(vertical ?x)
					)
	:effect (and
					(not(position ?x ?initials ?initiale))
					(not(free ?finale))
					(free ?initials)
					(position ?x ?finals ?finale)
			)
)

(:action move_left
	:parameters (?x - car ?initials - grid ?initiale - grid ?finals - grid ?finale - grid)
	:precondition	(and
							(position ?x ?initials ?initiale)
							(neighbourleft ?initials ?finals)
							(neighbourleft ?initiale ?finale) 
							(free ?finals)
							(horizontal ?x)
				  	)	
	:effect (and
					(free ?initiale)
					(not(position ?x ?initials ?initiale))
					(position ?x ?finals ?finale)
					(not(free ?finals))
			)

)

(:action move_right
	:parameters (?x - car ?initials - grid ?initiale - grid ?finals - grid ?finale - grid)
	:precondition	(and
							(position ?x ?initials ?initiale)
							(neighbourleft ?finale ?initiale)
							(neighbourleft ?finals ?initials)
							(horizontal ?x)
							(free ?finale)
					)
	:effect (and
					(not(position ?x ?initials ?initiale))
					(position ?x ?finals ?finale)
					(not(free ?finale))
					(free ?initials)
			)
))

