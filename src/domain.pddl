(define (domain hotel)
    (:requirements :typing :negative-preconditions :disjunctive-preconditions :equality)
    
    (:types person room couple)

    (:functions (total-cost)
                (price ?room - room)
    )
    
    (:predicates (double-room ?doubleRoom - room)
                 (triple-room ?tripleRoom - room)
                 (quadruple-room ?quadrupleRoom - room)
                 (couple-room ?coupleRoom - room)
                 (allocated ?person - person)
                 (allocated-couple ?couple - couple)
                 (is-available ?room - room)
                 (male ?person - person)
                 (female ?person - person)
    )

    (:action allocate-one-person
        :parameters (?person - person ?room - room)
        :precondition (and (not (allocated ?person))
                           (or (double-room ?room)
                               (triple-room ?room)
                               (quadruple-room ?room)
                               (couple-room ?room)
                           )
                           (is-available ?room)
        )
        :effect (and (allocated ?person)
                     (not (is-available ?room))
                     (increase (total-cost) (price ?room)))
    )

    (:action allocate-two-people
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?room - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (not (= ?person1 ?person2))
                           (or (and (male ?person1)
                                    (male ?person2))    
                               (and (female ?person1)
                                    (female ?person2))
                           )
                           (or (double-room ?room)
                               (triple-room ?room)
                               (quadruple-room ?room)
                           )
                           (is-available ?room)
                  
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (not (is-available ?room))
                     (increase (total-cost) (price ?room))
        )
    )
    
    (:action allocate-three-people
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?person3 - person
                     ?room - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (not (allocated ?person3))
                           (not (= ?person1 ?person2))
                           (not (= ?person1 ?person3))
                           (not (= ?person2 ?person3))
                           (or (and (male ?person1)
                                    (male ?person2)
                                    (male ?person3))    
                               (and (female ?person1)
                                    (female ?person2)
                                    (female ?person3))
                           )
                           (or (triple-room ?room)
                               (quadruple-room ?room)
                           )
                           (is-available ?room)
 
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (allocated ?person3)
                     (not (is-available ?room))
                     (increase (total-cost) (price ?room))
        )
    )

    (:action allocate-four-people
        :parameters (?person1 - person 
                     ?person2 - person 
                     ?person3 - person
                     ?person4 - person
                     ?room - room
        )
        :precondition (and (not (allocated ?person1))
                           (not (allocated ?person2))
                           (not (allocated ?person3))
                           (not (allocated ?person4))
                           (not (= ?person1 ?person2))
                           (not (= ?person1 ?person3))
                           (not (= ?person1 ?person4))
                           (not (= ?person2 ?person3))
                           (not (= ?person2 ?person4))
                           (not (= ?person3 ?person4))
                           (or (and (male ?person1)
                                    (male ?person2)
                                    (male ?person3)
                                    (male ?person4))    
                               (and (female ?person1)
                                    (female ?person2)
                                    (female ?person3)
                                    (female ?person4))
                           ) 
                           (quadruple-room ?room)
                           (is-available ?room)
        )
        :effect (and (allocated ?person1)
                     (allocated ?person2)
                     (allocated ?person3)
                     (allocated ?person4)
                     (not (is-available ?room))
                     (increase (total-cost) (price ?room))
        )
    )

    (:action allocate-couple
        :parameters (?couple - couple 
                     ?room - room
        )
        :precondition (and (not (allocated-couple ?couple))
                           (or (double-room ?room)
                               (triple-room ?room)
                               (quadruple-room ?room)
                               (couple-room ?room)
                           )
                           (is-available ?room)

        )
        :effect (and (allocated-couple ?couple)
                     (not (is-available ?room))
                     (increase (total-cost) (price ?room))
        )
    )    
)