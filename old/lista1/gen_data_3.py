import random


def generate_data(file_name="infolinia.txt", line_count=1024):
    names = [
        "Patryk",
        "Krzysztof",
        "Paulina",
        "Kuba",
        "Michal",
        "Dawid",
        "Tomasz",
        "Katarzyna",
        "Marcin",
        "Karolina",
        "Krzysztof",
        "Miroslawa",
        "Adam",
    ]

    with open(file_name, "w", encoding="utf-8") as file:
        for _ in range(line_count):
            if random.random() < 0.60:
                name = random.choice(names)
                file.write(f"ZGLOSZENIE: {name}\n")
            else:
                file.write("KONSULTANT_WOLNY\n")


if __name__ == "__main__":
    generate_data()
