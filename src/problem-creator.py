total_rooms = int(input())

rooms = []
for i in range(total_rooms):
    type, price = input().split()
    rooms.append((type, int(price)))

qnt_male, _ = input().split()
males = input().split()

qnt_female, _ = input().split()
females = input().split()

qnt_couples, _ = input().split()
couples = []
for i in range(int(qnt_couples)):
    couple = input().split()
    couples.append(couple[0])
    couples.append(couple[1])

with open('src/problem.pddl', 'w') as file:
    file.write('(define (problem aloca-pessoas-no-hotel)\n')
    file.write('    (:domain hotel)\n')
    file.write('    (:requirements :universal-preconditions)\n')
    
    file.write('    (:objects ')
    
    for male in males:
        if not male in couples:
            file.write(f'{male} ')
    for female in females:
        if not female in couples:
            file.write(f'{female} ')
    file.write('- person\n')

    file.write('              ')
    for i in range(0, len(couples), 2):
        file.write(f'{couples[i]}&{couples[i+1]} ')
    file.write('- couple\n')

    file.write('              ')
    for i in range(total_rooms):
        file.write(f'room{i} ')
    file.write('- room\n')
    file.write('    )\n')  

    file.write('    (:init\n')
    for male in males:
        if not male in couples:
            file.write(f'           (not (allocated {male}))\n')

    for female in females:
        if not female in couples:
            file.write(f'           (not (allocated {female}))\n')

    for i in range(0, len(couples), 2):
        file.write(f'           (not (allocated-couple {couples[i]}&{couples[i+1]}))\n')

    for i in range(total_rooms):
        file.write(f'           (is-available room{i})\n')
        if rooms[i][0] == 'C':
            file.write(f'           (couple-room room{i})\n')
        elif rooms[i][0] == 'D':
            file.write(f'           (double-room room{i})\n')
        elif rooms[i][0] == 'T':
            file.write(f'           (triple-room room{i})\n')
        elif rooms[i][0] == 'Q':
            file.write(f'           (quadruple-room room{i})\n')
        file.write(f'           (= (price room{i}) {rooms[i][1]})\n')   

    file.write('           (= (total-cost) 0)\n    )\n') 
    
    file.write('    (:goal\n')
    file.write('      (and (forall (?person - person)(and (allocated ?person)))\n')
    file.write('           (forall (?couple - couple)(and (allocated-couple ?couple)))\n')
    file.write('      )\n')
    file.write('    )\n')

    file.write('    (:metric minimize (total-cost))\n')

    file.write(')')
