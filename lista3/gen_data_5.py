import random

def gen_database_data():
    names = ["Krzysztof", "Dawid", "Paulina", "Patryk", "Bartosz", "Bartek", "Franek", "Filip", "Kacper", "Tomasz", "Kuba"]
    surnames = ["Urban", "Sotek", "Krystek", "Epstein", "Kowalski", "Nowak", "Bednarczyk", "Charatonik"]
    cities = ["Wroclaw", "Czarnkow", "Gulcz", "Poznan", "Wielen", "Warszawa", "Krakow", "Wrzeszczyna", "Bukowiec"]

    with open("klienci.txt", "w", encoding="utf-8") as f:
        f.write("id_klienta\timie\tnazwisko\tmiasto\n")
        for i in range(1, 31):
            name = random.choice(names)
            surname = random.choice(surnames)
            city = random.choice(cities)
            f.write(f"{i}\t{name}\t{surname}\t{city}\n")

    authors = ["Fyodor Dostoyevsky", "Vladimir Nabokov", "Albert Camus", "Franz Kafka", "Patryk Urban", "Krzysztof Urban", "Victor Hugo", "Minae Mizumura", "Edogawa Ranpo", "Andrzej Sapkowski", "Miron Bialoszewski"]
    titles_prefix = ["Tajemnica", "Wladca", "Czas", "Krew", "Cien", "Ostatni", "Prawdziwy"]
    titles_suffix = ["Smoka", "Urbana", "Sotka", "Gorki", "Krolow", "Przeszlosci", "Wiek", "Rycerz"]

    with open("ksiazki.txt", "w", encoding="utf-8") as f:
        f.write("id_ksiazki\ttytul\tautor\trok_wydania\tcena\n")
        for i in range(1, 31):
            author = random.choice(authors)
            title = f"{random.choice(titles_prefix)} {random.choice(titles_suffix)}"

            if author in ["Patryk Urban", "Andrzej Sapkowski", "Miron Bialoszewski"]:
                year = random.randint(2011, 2023)
            else:
                year = random.randint(1870, 1950)

            price = round(random.uniform(25.0, 90.0), 2)
            f.write(f"{i}\t{title}\t{author}\t{year}\t{price}\n")

    with open("zamowienia.txt", "w", encoding="utf-8") as f:
        f.write("id_zamowienia\tid_klienta\tid_ksiazki\tdata_zamowienia\n")
        
        big_id = 7
        books_bought = list(range(1, 28))
        order_id = 1

        for _ in range(150):
            if random.random() < 0.2:
                client_id = big_id
            else:
                client_id = random.randint(1, 20)

            book_id = random.choice(books_bought)

            if random.random() < 0.35:
                year = "2023"
                month = "03"
                day = str(random.randint(1, 31)).zfill(2)
            else:
                year = str(random.randint(2021, 2023))
                month = str(random.randint(1, 12)).zfill(2)
                day = str(random.randint(1, 28)).zfill(2)

            date = f"{year}-{month}-{day}"

            f.write(f"{order_id}\t{client_id}\t{book_id}\t{date}\n")
            order_id += 1


if __name__ == "__main__":
    gen_database_data()
