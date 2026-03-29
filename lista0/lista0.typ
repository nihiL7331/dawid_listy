#set page(
  paper: "us-letter",
  fill: rgb("121212"),
  margin: 1.25in,
)

#set text(
  font: "JetBrainsMono NF",
  fill: rgb("e4e4e4"),
  size: 11pt,
  lang: "pl",
  region: "pl",
)

#show raw: set text(font: "JetBrainsMono NF")

#show raw.where(block: true): block.with(
  fill: rgb("1e1e1e"),
  inset: 10pt,
  radius: 4pt,
  stroke: rgb("333333"),
  width: 100%,
)

#show raw.where(block: false): box.with(
  fill: rgb("2a2a2a"),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show math.equation: set text(size: 1.15em)

// sekcja na definicje
#let LIN = math.op("LIN")
#let dim = math.op("dim")
#let answer(equation) = align(center)[
  #box(stroke: white, inset: 8pt, radius: 4pt)[
    #equation
  ]
]

= Podstawy informatyki: Lista 0
*Data:* #datetime.today().display()

== Notatki do zadan

=== Przetwarzanie plikow i tekstu (zadania 2 i 3)

Matura z informatyki polega glownie na operacji na duzych plikach tekstowych. Dlatego kluczowym jest wiedziec, jak takie pliki otwierac i przetwarzac.

Najwazniejsza zasada w *Pythonie* jest uzywanie konstrukcji `with open()`. Automatycznie dba ona o zamkniecie pliku, nawet jesli w trakcie programu wystapi blad.

*Podstawowa skladnia:*
```py
with open("dane.txt", "r", encoding="utf-8") as plik:
  linia = plik.readline() # czyta jedna linie
  wszystko = plik.read() # czyta caly plik do jednego stringa
```
*Tryby:*
- `"r"` - read/odczyt,
- `"w"` - write/nadpisywanie,
- `"a"` - append/dopisywanie.

Dodatkowo, aby przetworzyc linie trzeba pamietac o dwoch waznych funkcjach: `.strip()` i `.split()`:

`.strip(chars)`: \
Pliki tekstowe na koncu kazdej linii maja znak (char) nowej linii: `'\n'`. Aby je usunac, wystarczy wywolac `linia.strip()`. Jest to wazne, bo jezeli tego nie wywolasz i sprobujesz skonwertowac cos na inta, moze wywalic blad bo wezmie ta liczbe z znakiem nowej linii.

`.split(chars)` : \
Jesli w jednej linii sa dane oddzielone spacja (np. 13 67 2137)
trzeba uzyc `.split(" ")` aby zamienic to na liste (tablice dynamiczna).

*Przykladowy kod:* \
```py
with open("data.txt", "r") as file_in, open("wyniki.txt", "w") as file_out:
    for line in file_in:
        fragments = line.strip().split(";")
        name_surname = fragments[0]
        grades = [int(x) for x in fragments[1:]] # zamiana na liczby
        avg = sum(grades) / len(grades)

        if avg > 4.0:
            file_out.write(f"{name_surname}: {avg:.2f}\n")
```

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

=== Struktury danych: Stos i kolejka (zadania 4 i 5)

W Pythonie najczesciej uzywamy zwyklych list (tablic dynamicznych), poniewaz pozwalaja one na dostep do dowolnego elementu. Jednak w algorytmice bardzo czesto potrzebujemy struktur o scisle okreslonych, rygorystycznych zasadach dodawania i usuwania danych.

*Stos (stack) - LIFO* \
LIFO to akronim od *Last In, First Out*. \
Wyobraz to sobie jako stos talerzy w kuchni - mozesz dolozyc nowy talerz tylko na sama gore, i mozesz zdjac tylko ten talerz, ktory lezy na samej gorze. Nie wyciagniesz talerza ze srodka. \
*Podstawowe operacje:* \
- `push(element)` - dodanie elementu *na szczyt* stosu,
- `pop()` - pobranie (i usuniecie) elementu *ze szczytu* stosu,
- `is_empty()` - sprawdzenie, czy stos *nie jest pusty*.
*Przyklady z prawdziwosci:* \
Przykladem uzycia stosu sa chociazby:
- opcja "undo" w edytorach tesktu,
- historia odwiedzonych stron w przegladarce.

#line(length: 100%, stroke: 1pt + rgb("333333"))

*Kolejka (queue) - FIFO* \
FIFO to akronim od *First In, First Out*. \
Dziala to dokladnie tak samo, jak kolejka do kasy w sklepie - klient, ktory ustawil sie w kolejce jako pierwszy, zostanie obsluzony jako pierwszy. Nowe elementy zawsze trafiaja na sam koniec. \
*Podstawowe operacje:* \
- `enqueue(element)` - dodanie elementu na koniec kolejki,
- `dequeue()` - pobranie (i usuniecie) pierwszego elementu z przodu kolejki,
- `is_empty()` - sprawdzenie, czy kolejka nie jest pusta.
*Przyklady z prawdziwosci:* \
Obsluga zapytan do serwera, systemy operacyjne, kolejka drukarki (jak w zadaniu 5).

#line(length: 100%, stroke: 1pt + rgb("333333"))

*Wskazowka implementacyjna:* \
Piszasz wlasna klase `Stack` lub `Queue`, wewnatrz niej jako kontenera na dane mozesz uzyc standardowej listy. Pamietaj, ze `lista.append()` dodaje na koniec, `lista.pop()` usuwa z konca, a `lista.pop(0)` usuwa z samego poczatku (indeks zero).


#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 1 (rozgrzewkowe)
Napisz program, ktory sprawdza, czy podana liczba jest doskonala (jest liczba naturalna, ktora jest suma wszystkich swych naturalnych dzielnikow wlasciwych (tzn. od niej mniejszych)).

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 2
Zadanie to bedzie operowac na pliku `bin_data.txt`. \
*a)* Wczytaj dane z pliku. \
*b)* Napisz program, ktory liczy ilosc parzystych liczb w pliku. \
*c)* Na podstawie danych z pliku, wygeneruj nowy plik `bin_data_int.txt` ktory zawiera te same liczby, ale w systemie dziesietnym. \
*d)* Znajdz ilosc liczb w pliku, ktore zawieraja w sobie sekwencje `1111`.

== Zadanie 3
Zadanie to bedzie operowac na plikach `1984.txt` i `zakazane.txt`. Pierwszy zawiera fragment ksiazki *"1984"* autorstwa *George'a Orwell'a*. Drugi, to lista slow zakazanych. \
*a)* Wczytaj dane z pliku. \
*b)* Napisz program wczytujacy liste slow do struktury danych `set`. \
*c)* Napisz program generujacy plik `ocenzurowane_1984.txt`, w ktorym zawarta jest tresc pliku `1984.txt`, w ktorym kazde slowo z listy zakazanych zostanie zastapione gwiazdkami (`***`). \
#sub[*Podpowiedz:* Rozwiazanie powinno respektowac wielkosc liter.]

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 4
Napisz funkcje `czy_poprawne(napis)`, ktora za pomoca *wlasnej implementacji stosu* sprawdzi, czy nawiasy w podanym wyrazeniu sa prawidlowo sparowane. \
*Przyklady*:
```py
czy_poprawne("(([]){})") # jest okej, zwraca True
czy_poprawne("([)]") # nawiasy sie krzyzuja, zwraca False
czy_poprawne("(()") # niezamkniety nawias, zwraca False
```
Zadanie powinno byc wykonane w nastepujacych krokach: \
*a)* Dowiedz sie czym jest *stos*. Wyjasnij, co oznacza LIFO. \
*b)* Przypomnij sobie, czym sa klasy, na czym polegaja i jak uzywa sie ich w Pythonie. \
*c)* Przy uzyciu klas i list, zaimplementuj klase `Stack` posiadajaca metody `pop()` i `push()`. \
*d)* Napisz powyzsza funkcje przy uzyciu nowo stworznej implementacji. (Jest ona latwa, ale jezeli nie masz pomyslu to moge ci napisac co powinna robic ta funkcja, jako ze to nie glowny problem tego zadania). \

== Zadanie 5
Zaimplementuj system obslugi zadan drukowania, korzystajacy z *wlasnej implementacji kolejki*. Program powinien obslugiwac trzy komendy:
- `dodaj_dokument(nazwa_dokumentu)` - dodaje dokument do kolejki,
- `drukuj_dokument()` - pobiera pierwszy dokument z kolejki i wypisuje komunikat: `"Drukowanie: [nazwa]"`,
- `status_drukarki()` - wypisuje liczbe dokumentow obecnych w kolejce.
Zadanie powinno byc wykonane w nastepujacych krokach: \
*a)* Dowiedz sie czym jest *kolejka*. Wyjasnij, co oznacza FIFO. \
*b)* Przy uzyciu klas i list, zaimplementuj klase `Queue` posiadajaca metody `enqueue()` i `dequeue()`. \
*c)* Napisz powyzsze funkcje przy uzyciu nowo stworznej implementacji.
