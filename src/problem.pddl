(define (problem aloca-uma-pessoa-em-um-quarto)
    (:domain hotel)
  
    (:objects person1 person2 person3 - person
                room1 room2 room3 room4 room5 - room
    )
  
    (:init (available room1)
           (available room2)
           (available room3)
           (available room4)
           (available room5)
           (not-alocatted person1)
           (not-alocatted person2)
           (not-alocatted person3)
    )
    
    (:goal
        (forall (?p - person)
          (exists (?r - room)
            (and
              (alocatted-on ?p ?r)
            )
          )
        )
     )
)