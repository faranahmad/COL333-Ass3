(define (problem os-sequencedstrips-small-4)
        (:domain Far)
        (:objects grid_1 grid_2 - grid car_1 - car )
        (:init (occupied car_1 grid_1) (free grid_2) (position car_1 grid_1) (horizontal car_1))
        (:goal (position car_1 grid_1)))
