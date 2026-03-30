#set page(
  paper: "us-letter",
  fill: rgb("121212"),
  margin: 1.25in,
)

#set text(
  font: "Iosevka NF",
  fill: rgb("e4e4e4"),
  size: 11pt,
  lang: "pl",
  region: "pl",
)

#show raw: set text(font: "Pixel Code")
#show strong: set text(fill: white, weight: 700)
#show link: set text(fill: rgb("58a6ff"))

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

= Podstawy informatyki: Lista 1
*Data:* #datetime.today().display()

== Notatki do zadan

#v(1em)

*Dodatkowa regula:* \
W zadaniach ponizej znajda sie *pogrubione* slowa. Masz za zadanie przeczytac i dowiedziec sie, co oznaczaja te slowa (jezeli jeszcze nie wiesz/nie wiesz wiele na dany temat). Staraj sie nie uzywac sztucznej inteligencji, jezeli gdzies sie zablokujesz to ewentualnie dopuszczam uzycia AI konczac kazdy prompt piszac: "Potrzebuje tylko podpowiedzi, nie pisz kodu."

#v(1em)

*Odwrotna Notacja Polska (ONP) i jej algorytm (zadanie 2)* \
To sposob zapisywania rownan matematycznych bez uzycia nawiasow. Zamiast pisac `(2 + 3) * 5`, w ONP zapisujemy to jako `2 3 + 5 *`. Do rozwiazywania takich rownan idealnie nadaje sie *Stos*, ktory zaimplementowales na poprzedniej liscie.

Algorytm dziala nastepujaco:
1. Czytasz rownanie znak po znaku (od lewej do prawej).
2. Jesli znak jest liczba, wrzucasz go na stos (`push`).
3. Jesli znak jest *operatorem binarnym* (np. `+`, `*`), zdejmujesz ze stosu dwie ostatnie liczby (`pop`), wykonujesz na nich to dzialanie, a wynik wrzucasz z powrotem na stos.
4. Na koncu na stosie zostanie tylko jedna liczba – to wynik calego rownania.

#v(2em)

*Wyszukiwanie binarne (Binary search) (zadanie 4)* \
Wyobraz sobie, ze szukasz slowa w slowniku. Nie czytasz go strona po stronie od poczatku (to tzw. wyszukiwanie liniowe). Zamiast tego otwierasz slownik na srodku – jesli szukane slowo jest alfabetycznie wczesniej, odrzucasz cala prawa polowe i znowu szukasz na srodku lewej polowy. To wlasnie *Binary Search*.

*Rekurencja z memoizacja (zadanie 5)* \
Znasz juz rekurencje. Klasycznym przykladem jest ciag Fibonacciego: $F(n) = F(n-1) + F(n-2)$. Sprobuj jednak policzyc $F(40)$ zwykla rekurencja – zauwazysz, ze komputer "zamarznie". Dzieje sie tak, poniewaz program wielokrotnie (miliony razy) oblicza te same wartosci od nowa.

Rozwiazaniem jest *Memoizacja* (Cache) – technika polegajaca na zapisywaniu wynikow funkcji do *slownika*, abysmy przy kolejnym zapytaniu o ta sama wartosc od razu wyciagneli ja z pamieci. To fundament *Programowania Dynamicznego*.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 1 (rozgrzewkowe)
W profesjonalnym swiecie nikt nie wysyla kodu przez messengera. Uzywamy do tego *systemow kontroli wersji*. Twoim pierwszym zadaniem, zanim napiszesz linijke kodu, jest opanowanie podstaw *Git-a*.

Wszystkie rozwiazania z tej listy musisz dostarczyc mi w formie *Pull Requesta* (PR) do tego *repozytorium* na GitHubie.

*Kroki do wykonania:*
1. Jezeli jeszcze tego nie zrobiles, wygeneruj i dodaj klucz SSH do twojego agenta. Poradnik jak to zrobic mozesz znalezc #link("https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent?platform=linux")[tutaj].
2. Sklonuj repozytorium, ktore Ci udostepnilem: \
  `git clone <LINK_DO_TWOJEGO_REPO>`
3. Stworz wlasna *galaz* (branch) na swoje rozwiazania. Nie piszemy bezposrednio w `main`! \
  `git checkout -b rozwiazania-lista1`
4. Po rozwiazaniu kazdego zadania, zapisz ten stan w historii: \
  `git add .` \
  `git commit -m "Dodano implementacje drzewa BST (Zadanie 2)"`
5. Gdy skonczysz cala liste, wyslij swoja galaz na serwer: \
  `git push origin rozwiazania-lista1`
6. Wejdz na GitHuba i otworz PR. Wtedy bede mogl zrobic Ci *Code Review*.
#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 2
W repozytorium znajdziesz plik `dzialania_onp.txt`. Kazda jego linijka to jedno rownanie.
1. Uzyj swojej klasy `Stack` z poprzedniej listy (skopiuj ja do nowego pliku).
2. Wczytaj plik, podziel kazda linie uzywajac `.split(" ")` i oblicz wynik uzywajac algorytmu ONP.
3. Zapisz wyniki do nowego pliku `wyniki_onp.txt`.

#v(1em)

== Zadanie 3
Wykorzystajmy teraz Twoja klase `Queue` do rozwiazania problemu z zycia wzietego. Wyobraz sobie system obslugi zgloszen, gdzie klienci dzwonia z problemami, a konsultanci obsluguja ich w kolejnosci zgloszen (*FIFO*).

W repozytorium znajduje sie plik `infolinia.txt`. Kazda linia to jedno z dwoch zdarzen:
- `ZGLOSZENIE: [IMIE]` – nowa osoba dzwoni na infolinie.
- `KONSULTANT_WOLNY` – konsultant konczy wczesniejsza rozmowe i prosi o nastepna osobe.

1. Uzyj swojej klasy `Queue`. Wczytuj plik linia po linii.
2. Jesli trafisz na `ZGLOSZENIE`, dodaj imie do kolejki (`enqueue`).
3. Jesli trafisz na `KONSULTANT_WOLNY`, zdejmij osobe z kolejki (`dequeue`) i zapisz w pliku `obsluzeni.txt` linie: `Rozmowa z: [Imie]`.
4. Moze sie zdarzyc, ze konsultant jest wolny, ale kolejka jest pusta! W takiej sytuacji zapisz w pliku `obsluzeni.txt` komunikat: `Brak klientow, konsultant pije kawe.`.
5. Na koncu programu wypisz w konsoli, ile osob zostalo w kolejce po zamknieciu infolinii.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 4
Napisz funkcje `binary_search(posortowana_lista, szukana_liczba)`, ktora dziala wedlug logiki zawartej w notatkach.
1. Funkcja ma zwracac `True`, jesli liczba jest w liscie, lub `False`, jesli jej nie ma.
2. Dodaj do funkcji licznik krokow (iteracji petli).
3. Przetestuj swoja funkcje na wygenerowanej liscie 100 000 kolejnych liczb. Wypisz w konsoli, w ilu krokach program znalazl liczbe `99999` za pomoca Twojej funkcji, a w ilu znalazlby ja za pomoca zwyklej petli `for`.
4. \* Na podstawie powyzszej obserwacji, sprobuj ustalic i zaargumentowac zlozonosc czasowa wyszukiwania binarnego.
#sub[*Wskazowka dla podpunktu 4:* Sprobuj wyznaczyc, ile w najgorszym przypadku (pesymistycznie) krokow wykona wyszukiwanie binarne dla posortowanej tablicy o `n` elementach.]

== Zadanie 5
Zadanie to dotyczy optymalizacji wspanialego ciagu Fibonacciego.
1. Napisz naiwna (zwykla) funkcje rekurencyjna `fib_naive(n)`. Sprawdz, przy jakim `n` twoj komputer zaczyna sie dlawic.
2. Stworz nowa funkcje `fib_memo(n, pamiec)`. Dodaj do niej slownik (typu `{n: wynik}`).
3. Zmodyfikuj funkcje tak, by na samym poczatku sprawdzala: jesli `n` jest juz w slowniku, po prostu zwroc wynik. Jesli nie, oblicz go rekurencyjnie, ZAPISZ do slownika i dopiero wtedy zwroc.
