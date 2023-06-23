(define (domain hotel)
    (:requirements :typing)
    
    (:types person room)
    
    (:predicates (available ?room - room)
                 (not-alocatted ?person - person)
                 (alocatted-on ?person - person ?room - room)
    )
    
    
    (:action allocate
        :parameters (?person - person ?room - room)
        :precondition (and (available ?room)
                            (not-alocatted ?person)
                      )
                    
        :effect (and (alocatted-on ?person ?room)
                     (not (not-alocatted ?person))
                     (not (available ?room))
                )
    )
)