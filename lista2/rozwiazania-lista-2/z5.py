def labirynt(plik):
    macierz = []
    with open(plik, "r") as f:
        for l in f:
            elem = l.strip().split()
            macierz.append(elem)

    wiersz = len(macierz)
    kolumna = len(macierz[0])
    start = (0, 0)
    koniec = (wiersz - 1, kolumna - 1)
    kolejka = [start]
    pindulindu = {start: None}
    while len(kolejka) > 0:
        ow, ok = kolejka.pop(0)
        if (ow, ok) == koniec:
            break
        kierunki = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        for dw, dk in kierunki:
            nw = ow + dw
            nk = ok + dk
            if 0 <= nw < wiersz and 0 <= nk < kolumna:
                if macierz[nw][nk] == "0" and (nw, nk) not in pindulindu:
                    pindulindu[(nw, nk)] = (ow, ok)
                    kolejka.append((nw, nk))
    krok = koniec
    while krok is not None:
        w, k = krok
        macierz[w][k] = "*"
        krok = pindulindu[krok]

    for wiersz in macierz:
        wiersze = " ".join(wiersz)
        print(wiersze)


labirynt("maze.txt")
