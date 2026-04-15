def przesun(A, k):
    n = len(A)
    for _ in range(k):
        pom = A[n - 1]
        for j in range(n - 1, 0, -1):
            A[j] = A[j - 1]
        A[0] = pom
    return A


print(przesun([6, 7, 21, 37, 41, 67, 69, 420], 2))

# rucha psa jak sra kurwa jebac urbana ta ulana cweloze kurwa japeirdole wali tego konika pod stolem jebana podstolina sie znalazla

# no ten cipkowaty algorytm tej nie tej
# przesuwa liczby w tym cipkowatej tablicy tej
# o k razy i jak jakis element tej nie
# wypierdala poza obszar tablicy tej
# to wypierdala na poczatek
# wuchta wiaray sie zebrala w tej bimbie tej
