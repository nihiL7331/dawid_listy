def binary_search(posortowana_lista, szukana_liczba):
    lewy = 0
    prawy = len(posortowana_lista) - 1
    kroki = 0

    while prawy >= lewy:
        kroki += 1
        srodek = (lewy + prawy) // 2
        if posortowana_lista[srodek] == szukana_liczba:
            return True, kroki
        elif posortowana_lista[srodek] < szukana_liczba:
            lewy = srodek + 1
        else:
            prawy = srodek - 1
    return False, kroki


test = list(range(100000))
szukana = 99999
x, y = binary_search(test, szukana)

kulnik = 0
for i in test:
    kulnik += 1
    if i == szukana:
        break

print(f"{y}")
print(f"{kulnik}")
