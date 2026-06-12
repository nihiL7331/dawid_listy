import random


def gen_bin_file(file_name="bin_data.txt", num_count=1024):
    with open(file_name, "w", encoding="utf-8") as f:
        for _ in range(num_count):
            num_dec = random.randint(1, 4095)
            num_bin = format(num_dec, "b")
            f.write(num_bin + "\n")


if __name__ == "__main__":
    gen_bin_file()
