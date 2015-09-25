; Authors Kartikeya Gupta

(define (domain Kar)
(:requirements :adl)

(:types car
	grid
)

(:predicates: 	(carfrom ?x - grid ?y - grid)
				(samelength ?x - grid ?y - grid ?z - grid ?w - grid)
				(isinbetween ?init - grid ?mid - grid ?final - grid)
)

(:action move
	:parameters (?x - car ?initial1 - grid ?initial2 - grid ?final1 - grid ?final2 - grid)
	:precondition (and 
					(carfrom ?initial1 ?initial2)
					(samelength ?initial1 ?initial2 ?final1 ?final2)
					(forall (?midpos - grid) 
						(imply (isinbetween ?final1 ?midpos ?initial1) 
							(or (isinbetween ?initial1 ?midpos ?initial2)
								(forall (t1 - grid) 
									(forall (t2 - grid)
										(imply (carfrom ?t1 ?t2)
											(or (and (= ?t1 ?intial1) (= ?t2 ?initial2))
												(not (isinbetween ?t1 ?midpos ?t2))
											)
										)
									)
								) 
							)
						)
					)
				)
	:effect (and (not(carfrom ?initial1 ?initial2)
				(carfrom ?final1 ?final2))
	)
)
)