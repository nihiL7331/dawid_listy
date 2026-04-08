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

#show raw: set text(font: "BigBlueTerm437 Nerd Font Mono")
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

= Podstawy informatyki: Lista 3
*Data:* #datetime.today().display()

== Notatki do zadan

Na tej liscie nadal obowiazuja reguly z poprzedniej listy, t.j.: \
*Reguly:* \
1. W zadaniach ponizej znajda sie *pogrubione* slowa. Masz za zadanie przeczytac i dowiedziec sie, co oznaczaja te slowa (jezeli jeszcze nie wiesz/nie wiesz wiele na dany temat).
2. Staraj sie nie uzywac sztucznej inteligencji, jezeli gdzies sie zablokujesz to ewentualnie dopuszczam uzycia AI konczac kazdy prompt piszac: "Potrzebuje tylko podpowiedzi, nie pisz kodu."
3. Dla slow *pogrubionych* sporzadz notatki w dodatkowym pliku `poboczne.md`. Naucz sie podstaw notacji w plikach typu *markdown* - czesc juz pewnie znasz, bo korzysta z tego Messenger. Przede wszystkim naucz sie naglowkow. Kazde pogrubione slowo powinno miec zdanie lub dwa ktore krotko opisuja "o co chodzi". Opisuj wszystko swoimi slowami, tak zebys ty to rozumial, a ja potwierdzil, ze wiem ze rozumiesz.

#v(2em)

=== Pseudokod
Pseudokod to uniwersalny jezyk zapisow algorytmow, ktory nie jest zgodny ze skladnia zadnego jezyka programowania. Jego idea jest to, ze powinien byc w stanie odczytac go kazdy, kto mial do czynienia z programowaniem.

*Zasady pseudokodu* \
#super[co najmniej tego maturalnego] \
1. Nie istnieja magiczne metody pokroju `.sort()`, `.append()`, czy sprawdzenie `if x in list`. Wszystko trzeba robic manualnie, za pomoca petli.
2. Zamiast znaku `=` do przypisywania wartosci, uzywa sie strzalki `<-`. Natomiast znak `=` oznacza operator przyrownania, odpowiednik `==` w Pythonie (i `===` w JavaScripcie).
3. Na arkuszach maturalnych indeksowanie tablic jest od $1$. Mozesz indeksowac w swoim pseudokodzie od $0$ (nie zabieraja za to punktow), ale musisz uwazac na pomylke przez np. tresc zadania. Zadania na tej liscie takze sa z zadaniami indeksowanymi od $1$.

#v(2em)

=== Relacyjne bazy danych
#super[nie wiem ile wiesz z baz danych, wiec to moga byc obvious rzeczy] \
Na maturze z informatyki zawsze pojawia sie zadanie z baz danych. Polega ono na imporcie danych z plikow tekstowych i powiazaniu ich za pomoca relacji w programie bazodanowym pokroju MS Access. \
*Kluczowe pojecia:*
1. *Klucz podstawowy (primary key)* - unikalny identyfikator rekordu w tabeli (np. `id_klienta`). Nigdy sie nie powtarza.
2. *Klucz obcy (foreign key)* - kolumna w tabeli, ktora odwoluje sie do klucza podstawowego innej tabeli (np. `id_klienta` w tabeli `Zamowienia`). To wlasnie dzieki niemu mozemy laczyc tabele za pomoca klauzuli `JOIN`.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 1
Ponizej znajduje sie pseudokod pewnego klasycznego algorytmu pracujacego na tablicy $A$ o rozmiarze $n$.
```text
Dane:
  A - tablica n liczb calkowitych, indeksowana od 1 do n
  k - dodatnia liczba calkowita

Algorytm:
  DLA i = 1 DO k WYKONUJ:
    pom <- A[n]
    DLA j = n W DOL DO 2 WYKONUJ:
      A[j] <- A[j-1]
    A[1] <- pom
```
1. Zaimplementuj powyzszy kod w Pythonie jako funkcje o sygnaturze `przesun(A, k)`. Zwroc uwage na to, ze Python indeksuje od $0$, a powyzszy pseudokod od $1$.
2. Uruchom funkcje dla tablicy `A = [10, 20, 30, 40, 50]` oraz `k = 2`. Odpowiedz w komentarzu w kodzie, co robi ten algorytm z tablica.

#v(2em)

== Zadanie 2
Dane slowa sa anagramami, jesli skladaja sie z tych samych liter (np. "alogik" i "logika"). W Pythonie sprawdzenie tego jest banalnie proste, przykladowo:
```py
def is_anagram(word1, word2):
  return sorted(word1) == sorted(word2)
```
Zapisz algorytm sprawdzajacy, czy dane slowa sa anagramami w pseudokodzie, nie uzywajac sortowania. \
#sub[*Wskazowka:* Mozesz policzyc wystapienia kazdej litery w pierwszym slowie (np. dodajac je do zdefiniowanej tablicy licznikow), a nastepnie odjac wystapienia liter drugiego slowa. Jesli na koniec w tablicy licznikow sa same zera - slowa sa anagramami.]


#v(2em)

== Zadanie 3
Jedna z najwazniejszych umiejetnosci w pracy z kodem na kartce jest tzw. *dry run*, czyli wykonanie kolejnych iteracji kodu recznie. Szczegolnie wazne jest to na maturze. \
Ponizej znajduje sie kod napisany w pseudokodzie.
```text
Dane:
  a = 24,
  b = 15

DOPOKI b > 0 WYKONUJ:
  reszta <- a MOD b
  a <- b
  b <- reszta
WYPISZ a
```
W pliku `poboczne.md` stworz tabelke (*Markdown table*) z trzema kolumnami: `a`, `b`, `reszta`. Symuluj dzialanie algorytmu krok po kroku i zapisuj w tabeli wartosci zmiennych po zakonczeniu kazdego obiegu petli, az do jej zakonczenia. Co wypisze ten algorytm? Jaka operacje wykonuje?

#v(2em)

== Zadanie 4
Pewien uczen o imieniu Kacper mial napisac algorytm, ktory sprawdza, czy tablica $A$ o dlugosci $n$ jest posortowana rosnaco. Napisal ponizszy kod:
```text
czy_posortowana <- PRAWDA
DLA i=1 DO n WYKONUJ:
  JEZELI A[i] > A[i+1] TO:
    czy_posortowana <- FALSZ

WYPISZ czy_posortowana
```
W tym kodzie znajduje sie pewien krytyczny blad, ktory spowoduje ze program nie zadziala jak powinien.
1. Wskaz, w ktorej linijce znajduje sie blad i wyjasnij, dlaczego wystepuje.
2. Zapisz poprawna wersje tego pseudokodu.

#v(2em)
#line(length: 100%, stroke: 1pt + rgb("333333"))
#v(2em)

== Zadanie 5
W folderze znajduja sie trzy pliki tekstowe, w ktorych dane sa rozdzielone znakami tabulacji (tak robi zazwyczaj CKE). Pierwszy wiersz kazdego pliku zawiera nazwy kolumn.
- `klienci.txt` (`id_klienta`, `imie`, `nazwisko`, `miasto`)
- `ksiazki.txt` (`id_ksiazki`, `tytul`, `autor`, `rok_wydania`, `cena`)
- `zamowienia.txt` (`id_zamowienia`, `id_klienta`, `id_ksiazki`, `data_zamowienia`)
Zaimportuj te pliki do MS Access i utworz miedzy nimi odpowiednie relacje. Nastepnie uzyj zapytan SQL, aby uzyskac odpowiedzi na ponizsze pytania.
1. Podaj alfabetyczna liste autorow (bez powtorzen), ktorzy wydali swoje ksiazki po 2010 roku.
2. Podaj imie i nazwisko klienta, ktory zlozyl najwieksza laczna liczbe zamowien. Podaj rowniez te liczbe.
3. Oblicz, jaki byl laczny przychod ksiegarni (suma cen sprzedanych ksiazek) w marcu 2023 roku.
4. Podaj tytuly i autorow wszystkich ksiazek, ktore *nigdy* nie zostaly zamowione przez zadnego klienta.
W pliku `odpowiedzi.md` zapisz wygenerowane wyniki (odpowiedzi na pytania) oraz *kod SQL*, ktory posluzyl do ich uzyskania. Dla kodu SQL, uzyj poprawnego zapisu aby wyrenderowac go jako kod. \
#sub[*Wskazowka:* W podpunkcie 4 najlatwiej jest wykorzystac zlaczenie `LEFT JOIN` z tabela zamowien i dodajac warunek, ktory szuka pustych pol (`IS NULL`).]
