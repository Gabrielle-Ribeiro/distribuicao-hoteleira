(define (domain hotel)
    (:requirements :typing :negative-preconditions)
    
    (:types person room)

    (:functions (total-cost))
    
    (:predicates (available-double-room ?doubleRoom - room)
                 (available-triple-room ?tripleRoom - room)
                 (available-quadruple-room ?quadrupleRoom - room)
                 (allocated ?person - person)
    )

    (:action allocate-one-person
        :parameters (?person - person ?room - room)
        :precondition (and (not (allocated ?person))
                           (available-double-room ?room)
        )
        :effect (and (allocated ?person)
                     (increase (total-cost) 1))
    )

    (:action allocate-double-room
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?doubleRoom - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (available-double-room ?doubleRoom)
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (not (available-double-room ?doubleRoom))
                     (increase (total-cost) 1)
        )
    )
    
    (:action allocate-triple-room
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?person3 - person
                     ?tripleRoom - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (not (allocated ?person3))
                           (available-triple-room ?tripleRoom)
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (allocated ?person3)
                     (not (available-triple-room ?tripleRoom))
                     (increase (total-cost) 1)
        )
    )

    (:action allocate-quadruple-room
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?person3 - person
                     ?person4 - person
                     ?quadrupleRoom - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (not (allocated ?person3))
                           (not (allocated ?person4))
                           (available-quadruple-room ?quadrupleRoom)
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (allocated ?person3)
                     (allocated ?person4)
                     (not (available-quadruple-room ?quadrupleRoom))
                     (increase (total-cost) 1)
        )
    )
    
        
)