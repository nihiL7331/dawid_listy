import random


def generate_data(file_name="dzialania_onp.txt", line_count=1024):
    operators = ["+", "-", "*"]

    with open(file_name, "w", encoding="utf-8") as file:
        for _ in range(line_count):
            expression = []
            stack_counter = 0

            expression.append(str(random.randint(1, 20)))
            expression.append(str(random.randint(1, 20)))
            stack_counter = 2

            for _ in range(random.randint(3, 8)):
                if stack_counter >= 2 and random.choice([True, False]):
                    expression.append(random.choice(operators))
                    stack_counter -= 1
                else:
                    expression.append(str(random.randint(1, 20)))
                    stack_counter += 1

            while stack_counter > 1:
                expression.append(random.choice(operators))
                stack_counter -= 1

            file.write(" ".join(expression) + "\n")


if __name__ == "__main__":
    generate_data()
