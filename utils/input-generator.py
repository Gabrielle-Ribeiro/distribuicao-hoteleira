from faker import Faker
import random
import unicodedata

fake = Faker('pt_BR')

with open('src/example.txt', 'w') as file:
    qnt_rooms = random.randint(5, 20)
    file.write(f'{qnt_rooms}\n')

    for _ in range(0, qnt_rooms):
        type = random.choice(['C', 'D', 'T', 'Q'])
        price = random.randint(50, 1000)
        file.write(f'{type} {price}\n')

    qnt_people = random.randint(5, qnt_rooms)

    males = []
    females = []
    people = []

    for _ in range(0, qnt_people):
        gender = random.choice(['F', 'M'])
        name = ''
        if gender == 'F':
            name = fake.first_name_female()
            name = name.split()[0]
            name = unicodedata.normalize('NFKD', name).encode('ASCII', 'ignore').decode('ASCII')
            if not name in females:
                females.append(name)
                people.append(name)
        elif gender == 'M':
            name = fake.first_name_male()
            name = name.split()[0]
            name = unicodedata.normalize('NFKD', name).encode('ASCII', 'ignore').decode('ASCII')
            if not name in males:
                males.append(name)
                people.append(name)
        
    file.write(f'{len(males)} M\n')
    for name in males:
        file.write(f'{name} ')
    file.write('\n')

    file.write(f'{len(females)} F\n')
    for name in females:
        file.write(f'{name} ')
    file.write('\n')

    qnt_couples = random.randint(1, (qnt_people//2))
    file.write(f'{qnt_couples} C\n')

    for _ in range(qnt_couples):
        person1 = random.choice(people)
        people.remove(person1)
        person2 = random.choice(people)
        people.remove(person2)
        file.write(f'{person1} {person2}\n')







