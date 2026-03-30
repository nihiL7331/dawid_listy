class Stack:
    def __init__(self):
        self.items = []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if self.items:
            return self.items.pop()
        return None


def oblicz_onp(linijka):
    stos = Stack()
    operacje = {
        "+": lambda a, b: a + b,
        "-": lambda a, b: a - b,
        "*": lambda a, b: a * b,
        "/": lambda a, b: a // b,
    }
    for i in linijka.split():
        if i in operacje:
            b, a = stos.pop(), stos.pop()
            stos.push(operacje[i](a, b))
        else:
            stos.push(int(i))
    return stos.pop()


rownania = []
with open("dzialania_onp.txt", "r") as f:
    for linia in f:
        zwykla = linia.strip()
        if zwykla:
            wynik = oblicz_onp(zwykla)
            rownania.append(wynik)


with open("wyniki_onp.txt", "w") as f:
    for w in rownania:
        f.write(f"{w}\n")
