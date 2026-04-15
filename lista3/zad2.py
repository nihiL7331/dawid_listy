def isAnagram(word1, word2):
    n = len(word1)
    m = len(word2)

    licznik = {}

    if n != m:
        return False

    for i in word1:
        if i in licznik:
            licznik[i] += 1
        else:
            licznik[i] = 1

    for i in word2:
        if i in licznik:
            licznik[i] -= 1
        else:
            return False

    for i in licznik.values():
        if i != 0:
            return False
    return True


print(isAnagram("cwel", "lewc"))


# Dane:
#
# word1 - slowo pierwsze (niemozliwe) string?ikr ale to zapisac ?!?!?
# word2 - slowo drugie (o japierdole naprawde?)
# n - dlugosc word1
# m - dlugosc word2

# Algorytm:

# jesli n jest rozne od m to:
# zwroc falsz

# licznik <- tablica
# dla kazdego znaku i w word1 wykonuj:
# jezeli i istnieje w licznik to:
# licznik[i] <- licznik[i] + 1
# w przeciwnym wypadku:
# licznik[i] <- 1

# dla kazdego znaku i w word2 wykonuj:
# jezeli i istnieje w licznik to:
# licznik[i] <- licznik[i] - 1
# w przeciwnym wypadku:
# zwruc falsz

# dla kazdej wartosci i w licznik wykonuj:
# jezeli i rozne od 0 to:
# zwroc falsz
# zwroc prawde
