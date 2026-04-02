class Macierz2x2:
    def __init__(self, a, b, c, d):
        self.data = [[a, b], [c, d]]

    def __mul__(self, other):
        a, b = self.data[0]
        c, d = self.data[1]
        e, f = other.data[0]
        g, h = other.data[1]

        return Macierz2x2(
            a * e + b * g,
            a * f + b * h,
            c * e + d * g,
            c * f + d * h,  # dih :) :D :o 3===D
        )

    def __pow__(self, n):
        wynik = Macierz2x2(1, 0, 0, 1)
        zlew = self
        while n > 0:
            if n % 2 == 1:
                wynik = wynik * zlew
            zlew = zlew * zlew
            n //= 2
            # NIE ZMIENIE MOTYW BUNTU JAK KACPER Z MAJOWKA
        return wynik


def fibb(n):
    m = Macierz2x2(1, 1, 1, 0)
    mk = m**n
    return mk.data[0][1]


print(fibb(2137))
