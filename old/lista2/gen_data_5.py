import random


def gen_data(file_name="maze.txt", size=30):
    maze = [
        [1 if random.random() < 0.30 else 0 for _ in range(size)] for _ in range(size)
    ]

    x, y = 0, 0
    maze[y][x] = 0
    while x < size - 1 or y < size - 1:
        if x == size - 1:
            y += 1
        elif y == size - 1:
            x += 1
        else:
            if random.random() < 0.5:
                x += 1
            else:
                y += 1
        maze[y][x] = 0

    maze[size - 1][size - 1] = 0

    with open(file_name, "w", encoding="utf-8") as file:
        for line in maze:
            file.write(" ".join(map(str, line)) + "\n")


if __name__ == "__main__":
    gen_data()
