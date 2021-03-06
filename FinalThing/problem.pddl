(define (problem test1)
	(:domain Far)
(:objects G_1_1 G_1_2 G_1_3 G_1_4 G_1_5 G_1_6 G_2_1 G_2_2 G_2_3 G_2_4 G_2_5 G_2_6 G_3_1 G_3_2 G_3_3 G_3_4 G_3_5 G_3_6 G_4_1 G_4_2 G_4_3 G_4_4 G_4_5 G_4_6 G_5_1 G_5_2 G_5_3 G_5_4 G_5_5 G_5_6 G_6_1 G_6_2 G_6_3 G_6_4 G_6_5 G_6_6  - grid  C_1 C_2 C_3 C_4 C_5 C_6 C_7 C_8  - car)
(:init (= (total-cost) 0) (prevcar C_1) 
( horizontal C_1)
 ( position C_1 G_4_3 G_5_3 )
 ( vertical C_2)
 ( position C_2 G_2_1 G_2_3 )
 ( horizontal C_3)
 ( position C_3 G_4_1 G_6_1 )
 ( vertical C_4)
 ( position C_4 G_3_4 G_3_5 )
 ( horizontal C_5)
 ( position C_5 G_1_5 G_2_5 )
 ( horizontal C_6)
 ( position C_6 G_1_6 G_2_6 )
 ( vertical C_7)
 ( position C_7 G_4_5 G_4_6 )
 ( horizontal C_8)
 ( position C_8 G_4_4 G_6_4 )
 ( free G_1_1 )
 ( free G_3_1 )
 ( free G_1_2 )
 ( free G_3_2 )
 ( free G_4_2 )
 ( free G_5_2 )
 ( free G_6_2 )
 ( free G_1_3 )
 ( free G_3_3 )
 ( free G_6_3 )
 ( free G_1_4 )
 ( free G_2_4 )
 ( free G_5_5 )
 ( free G_6_5 )
 ( free G_3_6 )
 ( free G_5_6 )
 ( free G_6_6 )

( neighbourup G_2_2 G_2_1 )
 ( neighbourup G_2_3 G_2_2 )
 ( neighbourup G_2_4 G_2_3 )
 ( neighbourup G_2_5 G_2_4 )
 ( neighbourup G_2_6 G_2_5 )
 ( neighbourup G_3_2 G_3_1 )
 ( neighbourup G_3_3 G_3_2 )
 ( neighbourup G_3_4 G_3_3 )
 ( neighbourup G_3_5 G_3_4 )
 ( neighbourup G_3_6 G_3_5 )
 ( neighbourup G_4_2 G_4_1 )
 ( neighbourup G_4_3 G_4_2 )
 ( neighbourup G_4_4 G_4_3 )
 ( neighbourup G_4_5 G_4_4 )
 ( neighbourup G_4_6 G_4_5 )

(= (distance C_1 C_1 )  1 )
 (= (distance C_1 C_2 )  2 )
 (= (distance C_1 C_3 )  2 )
 (= (distance C_1 C_4 )  2 )
 (= (distance C_1 C_5 )  2 )
 (= (distance C_1 C_6 )  2 )
 (= (distance C_1 C_7 )  2 )
 (= (distance C_1 C_8 )  2 )
 (= (distance C_2 C_1 )  2 )
 (= (distance C_2 C_2 )  1 )
 (= (distance C_2 C_3 )  2 )
 (= (distance C_2 C_4 )  2 )
 (= (distance C_2 C_5 )  2 )
 (= (distance C_2 C_6 )  2 )
 (= (distance C_2 C_7 )  2 )
 (= (distance C_2 C_8 )  2 )
 (= (distance C_3 C_1 )  2 )
 (= (distance C_3 C_2 )  2 )
 (= (distance C_3 C_3 )  1 )
 (= (distance C_3 C_4 )  2 )
 (= (distance C_3 C_5 )  2 )
 (= (distance C_3 C_6 )  2 )
 (= (distance C_3 C_7 )  2 )
 (= (distance C_3 C_8 )  2 )
 (= (distance C_4 C_1 )  2 )
 (= (distance C_4 C_2 )  2 )
 (= (distance C_4 C_3 )  2 )
 (= (distance C_4 C_4 )  1 )
 (= (distance C_4 C_5 )  2 )
 (= (distance C_4 C_6 )  2 )
 (= (distance C_4 C_7 )  2 )
 (= (distance C_4 C_8 )  2 )
 (= (distance C_5 C_1 )  2 )
 (= (distance C_5 C_2 )  2 )
 (= (distance C_5 C_3 )  2 )
 (= (distance C_5 C_4 )  2 )
 (= (distance C_5 C_5 )  1 )
 (= (distance C_5 C_6 )  2 )
 (= (distance C_5 C_7 )  2 )
 (= (distance C_5 C_8 )  2 )
 (= (distance C_6 C_1 )  2 )
 (= (distance C_6 C_2 )  2 )
 (= (distance C_6 C_3 )  2 )
 (= (distance C_6 C_4 )  2 )
 (= (distance C_6 C_5 )  2 )
 (= (distance C_6 C_6 )  1 )
 (= (distance C_6 C_7 )  2 )
 (= (distance C_6 C_8 )  2 )
 (= (distance C_7 C_1 )  2 )
 (= (distance C_7 C_2 )  2 )
 (= (distance C_7 C_3 )  2 )
 (= (distance C_7 C_4 )  2 )
 (= (distance C_7 C_5 )  2 )
 (= (distance C_7 C_6 )  2 )
 (= (distance C_7 C_7 )  1 )
 (= (distance C_7 C_8 )  2 )
 (= (distance C_8 C_1 )  2 )
 (= (distance C_8 C_2 )  2 )
 (= (distance C_8 C_3 )  2 )
 (= (distance C_8 C_4 )  2 )
 (= (distance C_8 C_5 )  2 )
 (= (distance C_8 C_6 )  2 )
 (= (distance C_8 C_7 )  2 )
 (= (distance C_8 C_8 )  1 )

( neighbourleft G_2_1 G_1_1 )
 ( neighbourleft G_2_3 G_1_3 )
 ( neighbourleft G_2_4 G_1_4 )
 ( neighbourleft G_2_5 G_1_5 )
 ( neighbourleft G_2_6 G_1_6 )
 ( neighbourleft G_3_1 G_2_1 )
 ( neighbourleft G_3_3 G_2_3 )
 ( neighbourleft G_3_4 G_2_4 )
 ( neighbourleft G_3_5 G_2_5 )
 ( neighbourleft G_3_6 G_2_6 )
 ( neighbourleft G_4_1 G_3_1 )
 ( neighbourleft G_4_3 G_3_3 )
 ( neighbourleft G_4_4 G_3_4 )
 ( neighbourleft G_4_5 G_3_5 )
 ( neighbourleft G_4_6 G_3_6 )
 ( neighbourleft G_5_1 G_4_1 )
 ( neighbourleft G_5_3 G_4_3 )
 ( neighbourleft G_5_4 G_4_4 )
 ( neighbourleft G_5_5 G_4_5 )
 ( neighbourleft G_5_6 G_4_6 )
 ( neighbourleft G_6_1 G_5_1 )
 ( neighbourleft G_6_3 G_5_3 )
 ( neighbourleft G_6_4 G_5_4 )
 ( neighbourleft G_6_5 G_5_5 )
 ( neighbourleft G_6_6 G_5_6 )

)
(:goal ( and ( horizontal C_1 ) ( position C_1 G_1_3 G_2_3)))
(:metric minimize (total-cost)))