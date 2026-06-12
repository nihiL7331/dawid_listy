def fib_naive(n):
    if n <= 1:
        return n
    return fib_naive(n - 1) + fib_naive(n - 2)


print(fib_naive(13))


def fib_memo(n, pamiec):
    if n in pamiec:
        return pamiec[n]
    if n <= 1:
        return n
    pamiec[n] = fib_memo(n - 1, pamiec) + fib_memo(n - 2, pamiec)
    return pamiec[n]


kesz = {}
print(fib_memo(67, kesz))
