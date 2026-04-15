def przesun(A, k):
    n = len(A)
    for _ in range(k):
        pom = A[n - 1]
        for j in range(n - 1, 0, -1):
            A[j] = A[j - 1]
        A[0] = pom
    return A


print(przesun([6, 7, 21, 37, 41, 67, 69, 420], 2))
