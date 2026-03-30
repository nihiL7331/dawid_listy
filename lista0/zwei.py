binarne = []
with open("bin_data.txt", "r") as plik:
    for linia in plik:
        linia = linia[:-2]
        binarne.append(linia)


def zamiana(liczby):
    zwykle = []
    for i in liczby:
        zwykla = int(i, 2)
        zwykle.append(zwykla)
    return zwykle


def parzyste(liczby):
    zwykle = zamiana(liczby)
    licznik = 0
    for i in zwykle:
        if i % 2 == 0:
            licznik += 1
    return licznik


def szukajnik(liczby):
    lapacz_pedofili = 0
    for i in liczby:
        if "1111" in i:
            lapacz_pedofili += 1
    return lapacz_pedofili


print(zamiana(binarne))
print(parzyste(binarne))
print(szukajnik(binarne))
dziesietne = zamiana(binarne)

with open("bin_data_int.txt", "w") as plik:
    for linia in dziesietne:
        plik.write(f"{linia}\n")

# Dziewczyny jakie były wasze pierwsze objawy ciąży przed wykonaniem jeszcze testu?
# Czy też was bolał brzuch i krzyż jak na okres? Przyznam że w pierwszej ciąży tak nie miałam tylko dopiero po wykonaniu testu odczuwałam takie ciągnięcia w brzuchu....

# U mnie pamiętam że w pierwszej ciąży ogromne ilości białej wydzieliny reszty objawów nie pamietam bo to dawno było a w poprzedniej ciąży to ogromny ból sutkow, lekki ból jak na miesiączkę i totalna suchość w pochwie niestety ciąża poroniona

# U mnie ból piersi od owulacji, zawsze bolały przed samym okresem, ciągnięcia w jajnikach itp, 2 dni po terminie okresu ból sutków. Innych objawów nie mam, a i temp mierzona rano powyżej 37.
