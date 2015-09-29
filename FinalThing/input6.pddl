(define (problem test1)
	(:domain Far)
(:objects G_1_1 G_1_2 G_1_3 G_2_1 G_2_2 G_2_3 G_3_1 G_3_2 G_3_3  - grid  C_1  - car)
(:init 
( horizontal C_1)
 ( position C_1 G_1_1 G_2_1 )
 ( free G_3_1 )
 ( free G_1_2 )
 ( free G_2_2 )
 ( free G_3_2 )
 ( free G_1_3 )
 ( free G_2_3 )
 ( free G_3_3 )


( neighbourleft G_2_1 G_1_1 )
 ( neighbourleft G_3_1 G_2_1 )

)
(:goal ( and ( horizontal C_1 ) ( position C_1 G_1_1 G_2_1)))
)