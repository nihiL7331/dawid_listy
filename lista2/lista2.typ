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

= Podstawy informatyki: Lista 2
*Data:* #datetime.today().display()

== Notatki do zadan

Na tej liscie nadal obowiazuja reguly z poprzedniej listy, t.j.: \
*Reguly:* \
1. W zadaniach ponizej znajda sie *pogrubione* slowa. Masz za zadanie przeczytac i dowiedziec sie, co oznaczaja te slowa (jezeli jeszcze nie wiesz/nie wiesz wiele na dany temat).
2. Staraj sie nie uzywac sztucznej inteligencji, jezeli gdzies sie zablokujesz to ewentualnie dopuszczam uzycia AI konczac kazdy prompt piszac: "Potrzebuje tylko podpowiedzi, nie pisz kodu."

Oprocz tego, na tej liscie obowiazuje jeszcze jedna regula: \
*Dodatkowa regula:* \
3. Dla slow *pogrubionych* sporzadz notatki w dodatkowym pliku `poboczne.md`. Naucz sie podstaw notacji w plikach typu *markdown* - czesc juz pewnie znasz, bo korzysta z tego Messenger. Przede wszystkim naucz sie naglowkow. Kazde pogrubione slowo powinno miec zdanie lub dwa ktore krotko opisuja "o co chodzi". Opisuj wszystko swoimi slowami, tak zebys ty to rozumial, a ja potwierdzil, ze wiem ze rozumiesz.

#v(2em)

*git TUI: lazygit* \
Na tej liscie przestaniemy uzywac czystych komend typu `git commit`. Twoim zadaniem jest przejscie na *lazygit*. lazygit to *TUI* pozwalajace korzystac z git'owych operand. Jest on po dluzszym uzytku bardzo wygodny, intuicyjny i trudno przy nim cos zepsuc (a to tutaj wazne). Nie bede tutaj wchodzic w glebsze operacje jakie mozna wykonac w gicie, bo sa one niepotrzebne dopoki nie pracujesz w wiekszej grupie osob/przy wiekszych projektach. \

#v(2em)

*Algorytm szybkiego potegowania (zadanie 1)* \
Zwykle potegowanie, np. $x^n$, wymaga $n-1$ mnozen. Wyliczenie $2^10$ to $2*2*dots*2$ (zlozonosc liniowa $O(n)$). Dla malych liczb to nie problem, ale co jesli chcemy podniesc macierz do potegi miliardowej? Miliard operacji mnozenia macierzy zablokuje komputer na dlugi czas. \
Tutaj z pomoca przychodzi strategia *Dziel i zwyciezaj*. Zauwaz prosta matematyczna zaleznosc:
- Jesli $n$ jest parzyste, mozemy to zapisac jako $x^n=(x^(n/2))^2$,
- Jesli $n$ jest nieparzyste, wyciagamy jednego $x$ przed nawias: $x^n=x*x^(n-1)$ (a $n-1$ jest juz parzyste!).
Jak to dziala w praktyce? \
Wezmy jako przyklad $x^8$. Zamiast mnozyc $x$ osiem razy, algorytm robi to tak:
1. Oblicza $x^2$ (jedno mnozenie)
2. Oblicza $(x^2)^2=x^4$ (drugie mnozenie)
3. Oblicza $(x^4)^2=x^8$ (trzecie mnozenie)
Wynik otrzymujemy w zaledwie $3$ krokach zamiast $7$. \
Dzieki temu ten algorytm redukuje zlozonosc czasowa z liniowego $O(n)$ do logarytmicznego $O(log n)$. Oznacza to, ze podniesienie liczby (lub macierzy) do potegi $1 000 000 000$ wymaga zaledwie okolo 30 operacji mnozenia!

#v(2em)

*Maszyna RAM (zadanie 4)* \
Wiekszosc jezykow, ktorych uzywasz (jak Python), to jezyki wysokiego poziomu. Ukrywaja one przed toba to, jak procesor faktycznie liczy dane. Jednak ponizej poziomu abstrakcji Pythona, czy nawet C, znajduje sie poziom, na ktorym programisci musza myslec w kategoriach *architektury procesora* (stad wspolczesnie rozny assembler na roznych platformach). Tutaj pojawia sie maszyna RAM. \
Maszyna RAM to uproszczony model matematyczny komputera. Sklada sie z:
1. Pamieci: nieskonczonej tasmy rejestrow (szufladek), ponumerowanych $r_0, r_1, r_2, dots$
2. Akumulatora: specjalnego rejestru roboczego (mozemy przyjac konwencje, ze jest nim $r_0$)
3. Licznika rozkazow (Program Counter): *wskaznika* mowiacego, ktora linijke kodu aktualnie wykonujemy.

W maszynie RAM nie ma petli `for` ani instrukcji `if`. Wszystko opiera sie na prostych operacjach i tzw. *skokach*. Przykladowo, aby dodac do siebie liczby z rejestru 1 i 2, program w asemblerze maszyny RAM moglby wygladac tak:
```text
LOAD  1 // wczytaj wartosc r_1 do akumulatora
ADD   2 // dodaj do akumulatora wartosc z r_2
STORE 3 // zapisz wynik z akumulatora w r_3
HALT    // zakoncz program
```

#v(2em)

*Grafy i algorytm BFS (zadanie 5)* \
Graf to zbior punktow (nazywanych wezlami/wierzcholkami) polaczonych liniami (krawedziami). Grafy sa wszedzie - sluza do modelowania sieci drogowych, laczenia znajomych na Facebooku, czy polaczen sieciowych. \
Zauwaz, ze dwuwymiarowy labirynt to nic innego jak graf. Kazde wolne pole to wezel, a krawedzie lacza go z sasiednimi polami (o ile nie ma tam sciany). \
Aby znalezc wyjscie z labiryntu, uzywamy algorytmu BFS, czyli przeszukiwania wszerz. \
Algorytm ten rozlewa sie po labiryncie we wszystkich kierunkach naraz, krok po kroku.
1. Zaczynamy w punkcie startowym.
2. Sprawdzamy wszystkich sasiadow odleglych o 1 krok.
3. Sprawdzamy wszsytkich sasiadow odleglych o 2 kroki, itd.
Algorytm BFS opiera sie na strukturze *FIFO* (kolejce). Kiedy odwiedzamy pole, wrzucamy wszystkich jego dostepnych sasiadow na koniec kolejki. Dzieki temu BFS gwarantuje, ze gdy po raz pierwszy trafimy na pole koncowe (wyjscie z labiryntu), to przeszlismy tam najkrotsza mozliwa droge.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 1 (rozgrzewkowe)
Pamietasz implementacje ciagu Fibonacciego z poprzedniej listy? Tak sie sklada, ze da sie wyznaczyc $n$-ta liczbe Fibonacciego w szybszy sposob. \
Uzywajac ponizszej zaleznosci:
$ mat(1, 1; 1, 0)^n=mat(F_(n+1), F_n; F_n, F_(n-1)) $
mozemy wykorzystac podnoszenie tej macierzy do potegi $n$-tej aby otrzymac oczekiwana wartosc. Twoje zadania to kolejno:
1. Zaimplementuj klase `Matrix2x2`, trzymajaca odpowiednie dane.
2. Dowiedz sie, czym jest *operator overloading*. Zaimplementuj go, tj. zaimplementuj funkcje:
- `__mul__(self, other)`: mnozenie dwoch obiektow `Matrix2x2`.
- `__pow__(self, n)`: podnoszenie macierzy do potegi $n$ (tutaj docelowo znajdzie sie algorytm z punktu 4!)
3. Wykorzystujac implementacje klasy `Matrix2x2`, napisz funkcje o sygnaturze `fib_mat(n)` zwracajaca $n$-ta liczbe Fibonacciego uzywajaca powyzszej zaleznosci.
4. \* Rozwaz, w jaki sposob *algorytm szybkiego potegowania* moglby przyspieszyc ten kod. Sprobuj zaimplementowac ten algorytm.
5. Zcommituj ten kod przy uzyciu lazygit na nowo utworzony branch o nazwie rozwiazania-lista-2.
#sub[*Podpowiedz dla punktu 4:* Do implementacji algorytmu szybkiego potegowania, potrzebna jest macierz jednostkowa, ktora mozesz dodac jako *metode statyczna*.]

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 2
W pliku `server_logs.txt` znajduje sie 50 000 wpisow w formacie: `TIMESTAMP;IP;ENDPOINT;RESPONSE_TIME;STATUS`. \
Przyklad: `2024-03-02T10:15:01;192.168.1.1;/api/v2/user;120;404`

Twoim zadaniem jest wygenerowanie raportu `stats.txt`, ktory odpowie na pytania:
1. Jaka jest srednia predkosc odpowiedzi dla kazdego unikalnego `ENDPOINT`u?
2. Ile razy wystapil *blad 418* w kazdej godzinie dnia (np. 10:00-11:00 -> 15 wystapien)?
3. Podaj liste 5 adresow IP, ktore wygenerowaly najwiekszy ruch (sumaryczny `RESPONSE_TIME`).
#sub[*Wskazowka:* Uzyj biblioteki `datetime` do *parsowania* czasu.]

#v(1em)

== Zadanie 3
Plik `punkty.txt` zawiera 10 000 par wspolrzednych typu `(x, y)`.
1. Znajdz pare punktow, ktore leza najdalej od siebie.
2. Ile punktow znajduje sie wewnatrz kola o srodku $(0,0)$ i promieniu $R=100$?
3. Znajdz najdluzszy ciag rosnacy punktow.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 4
*Maszyna RAM* to uproszczony model komputera. Posiada pamiec w postaci *rejestrow*. Twoim zadaniem jest napisac emulator maszyny RAM.

*Specyfikacja*
- Emulator ma wczytywac plik o rozszerzeniu `.ram` w ktorym kazda linia to komenda (np. `LOAD 5`, `ADD 1`, `JZERO label`).
- Musisz obsluzyc: `LOAD`, `STORE`, `READ`, `ADD`, `SUB`, `JUMP`, `JZERO`, `HALT` i dodatkowo `LOG`, printujacy stan rejestrow.
- Napisz w swoim emulatorze program, ktory mnozy dwie liczby pobrane z *standardowego wejscia* (uzywajac tylko dodawania i skokow!).

== Zadanie 5
*Grafy* to jedna z najwazniejszych struktur danych, podobnie jak wczesniej poruszone *kolejki* i *stosy*. Labirynt to nic innego jak graf, gdzie kazde pole jest wezlem. \
Wczytaj plik `maze.txt` (macierz 0 i 1, gdzie 1 to sciana, 0 to droga). Twoje zadania to kolejno:
1. Dowiedz sie, czym jest algorytm *BFS*.
2. Wykorzystaj kolejke i algorytm BFS do znalezienia najkrotszej drogi od lewego gornego rogu do prawego dolnego.
3. Wypisz labirynt w konsoli, zaznaczajac znaleziona sciezke znakami `*`.

