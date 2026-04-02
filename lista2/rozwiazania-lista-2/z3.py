punkty = []
with open("punkty.txt", "r") as f:
    for l in f:
        l = l.replace("(", "").replace(")", "").replace(",", "")
        dane = l.split()
        x = int(dane[0])
        y = int(dane[1])
        punkty.append((x, y))


def najdalsza_para(punkty):
    najwiekszy_dystans = 0
    para = (0, 0)
    for i in range(len(punkty)):
        for j in range(i + 1, len(punkty)):
            p1, p2 = punkty[i], punkty[j]
            pitagolas = (p1[0] - p2[0]) ** 2 + (p1[1] - p2[1]) ** 2
            if pitagolas > najwiekszy_dystans:
                najwiekszy_dystans = pitagolas
                para = (p1, p2)
    return para, najwiekszy_dystans**0.5


def pkt_kolo(punkty, r=100):
    licznik = 0
    kwadrat = r**2
    for x, y in punkty:
        if x**2 + y**2 <= kwadrat:
            licznik += 1
    return licznik


def najdluszy(punkty):
    n = len(punkty)
    tab = [1] * n
    for i in range(1, n):
        for j in range(i):
            if punkty[i][0] > punkty[j][0] and punkty[i][1] > punkty[j][1]:
                if tab[j] + 1 > tab[i]:
                    tab[i] = tab[j] + 1
    return max(tab)


print(najdalsza_para(punkty))
print(pkt_kolo(punkty))
print(najdluszy(punkty))
