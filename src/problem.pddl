(define (problem aloca-uma-pessoa-em-um-quarto)
    (:domain hotel)
    (:requirements :universal-preconditions)
  
    (:objects person1 person2 person3 person4 person5 person6 person7 - person
              room1 room2 room3 room4 room5 - room
    )
  
    (:init (not (allocated person1))
           (not (allocated person2))
           (not (allocated person3))
           (not (allocated person4))
           (not (allocated person5))
           (not (allocated person6))
           (not (allocated person7))
           (available-double-room room1)
           (available-double-room room2)
           (available-triple-room room3)
           (available-triple-room room4)
           (available-quadruple-room room5) 
           (= (total-cost) 0) 
    )
    
    (:goal
      (forall (?person - person)
        (and
          (allocated ?person)
        )
      )
    )

    (:metric minimize (total-cost))
)