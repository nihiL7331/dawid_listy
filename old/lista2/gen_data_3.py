import random


def gen_data(file_name="punkty.txt", count=10000):
    with open(file_name, "w", encoding="utf-8") as file:
        for _ in range(count):
            x = random.randint(-1000, 1000)
            y = random.randint(-1000, 1000)
            file.write(f"({x}, {y})\n")


if __name__ == "__main__":
    gen_data()
