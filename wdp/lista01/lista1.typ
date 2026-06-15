#set page(
  paper: "us-letter",
  fill: rgb("121212"),
  margin: 0.75in,
  header: align(right)[
    #text(fill: rgb("333333"), size: 9pt)[
      #datetime.today().display()
    ]
  ],
  footer: align(right)[
    #text(fill: rgb("333333"), size: 8pt)[
      Patryk Pujanek | gh: \@nihiL7331
    ]
  ],
)

#set par(justify: true, leading: 0.7em)

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

#show heading.where(level: 2): it => block(
  width: 100%,
  above: 2em,
  below: 1em,
  stroke: (bottom: 1pt + rgb("333333")),
  inset: (bottom: 6pt),
  it,
)
#show heading.where(level: 3): set text(
  fill: rgb("a8a8a8"),
  size: 1.1em,
  weight: "regular",
)

#show raw.where(block: false): box.with(
  fill: rgb("2a2a2a"),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)
#show math.equation.where(block: true): set block(above: 1.2em, below: 1.2em)
#show math.equation: set text(size: 1.15em)

// sekcja na definicje
#let LIN = math.op("LIN")
#let dim = math.op("dim")
#let rk = math.op("rk")
#let qed = align(right)[$square$]
#let hint(body) = block(
  width: 100%,
  fill: rgb("1a1a1a"),
  stroke: (left: 2pt + rgb("58a6ff")),
  inset: (x: 10pt, y: 8pt),
  radius: (right: 4pt),
  text(fill: rgb("a8a8a8"), size: 0.95em, body),
)
#let warn(body) = block(
  width: 100%,
  fill: rgb("1a1a1a"),
  stroke: (left: 2pt + rgb("f85149")),
  inset: (x: 10pt, y: 8pt),
  radius: (right: 4pt),
  text(fill: rgb("a8a8a8"), size: 0.95em, body),
)
#let answer(equation) = align(center)[
  #box(stroke: white, inset: 8pt, radius: 4pt)[
    #equation
  ]
]
#let tracker(total, done, starred: (), points: none) = {
  let items = range(1, total + 1).map(i => {
    let is-done = i in done
    let is-starred = i in starred

    let pts = if type(points) == dictionary {
      points.at(str(i), default: none)
    } else {
      points
    }

    let box-fill = if is-done { rgb("2E7D32") } else { rgb("1E1E1E") }

    let box-stroke = if is-starred {
      if is-done { rgb("D4AF37") } else { rgb("8B7322") }
    } else {
      if is-done { rgb("4CAF50") } else { rgb("333333") }
    }

    let text-color = if is-starred {
      if is-done { white } else { rgb("D4AF37") }
    } else {
      if is-done { white } else { rgb("AAAAAA") }
    }

    let main-box = box(
      width: 24pt,
      height: 24pt,
      radius: 4pt,
      fill: box-fill,
      stroke: 1.5pt + box-stroke,
      align(center + horizon)[
        #text(fill: text-color, weight: "bold", size: 10pt)[#i]
      ],
    )

    if pts != none {
      stack(
        dir: ttb,
        spacing: 5pt,
        main-box,
        align(center)[
          #text(fill: rgb("AAAAAA"), size: 7pt)[#pts pkt]
        ],
      )
    } else {
      main-box
    }
  })

  align(center, grid(
    columns: (auto,) * calc.min(total, 11),
    gutter: 10pt,
    align: top,
    ..items
  ))
}

#let flow(clr, ..steps) = align(center)[
  #box(
    fill: rgb("1a1a1a"),
    inset: 6pt,
    stroke: (top: 2pt + rgb("333333")),
    radius: 2pt,
  )[
    #show math.equation: set text(fill: rgb("e4e4e4"))
    #(
      steps
        .pos()
        .map(s => text(fill: clr, weight: "bold")[#s])
        .join([ $arrow.r$ ])
    )
  ]
]

#let codebox(code, file: none) = {
  show raw.line: line => {
    box(width: 1.5em, align(right, text(fill: rgb("333333"))[#line.number]))
    h(1em)
    line.body
  }

  show raw.where(block: true): set block(inset: 0pt)

  let code-inset = if file != none {
    (top: 0pt, bottom: 10pt, x: 10pt)
  } else {
    10pt
  }

  block(
    fill: rgb("1e1e1e"),
    stroke: 1pt + rgb("333333"),
    radius: 4pt,
    width: 100%,
    clip: true,
    {
      if file != none {
        block(
          width: 100%,
          inset: (top: 10pt, bottom: 6pt, x: 10pt),
          text(
            fill: rgb("a0a0a0"),
            size: 0.85em,
            weight: "bold",
            font: "Courier New",
            file,
          ),
        )
      }

      block(inset: code-inset, code)
    },
  )
}

#align(center)[
  #text(size: 22pt, weight: "black", fill: white)[WSTEP DO PROGRAMOWANIA] \
  #v(4pt)
  #text(size: 14pt, fill: rgb("a8a8a8"))[Lista 1]
]

#v(1.5em)

#tracker(3, (), starred: (3,))

== Zadanie 1
Rozwazmy nastepujacy kod:
#codebox[
  ```c
  #include <stdio.h>

  #define MAGIC(x) sum += x * x

  int main(void) {
    int it, sum;
    scanf("%d", &it);

    for (unsigned int i = it; i >= 0; i++) {
      MAGIC(i);
    }

    printf("%d\n", sum);
  }
  ```
]
1. Czemu ten kod nie zadziala poprawnie?
2. Napraw ten kod.
3. Wyjasnij, co robi `scanf` oraz czym jest `MAGIC` w tym kodzie. Czym rozni sie `MAGIC` od zwyklej funkcji?
4. Co oblicza ten kod?
#hint[*Wskazowka do podpunktu 3*: Makra.]

== Zadanie 2
Nie korzystajac z funkcji `printf` zaimplementuj rysowanie szachownicy o podanych parametrach, podanych jako argumenty wywolania.
- szerokosc planszy (w "kratkach"),
- wysokosc planszy (w "kratkach"),
- szerokosc kratki,
- wysokosc kratki,
- kolor kratki w (0, 0) (czarna/biala).
Czyli przykladowo wywolanie:
#codebox[
  ```bash
  ./a.out 5 5 2 2 1
  ```
]
Powinno zakonczyc sie takim outputem:
#codebox[
  ```bash
  ##  ##  ##
  ##  ##  ##
    ##  ##
    ##  ##
  ##  ##  ##
  ##  ##  ##
    ##  ##
    ##  ##
  ##  ##  ##
  ##  ##  ##
  ```
]
#hint[*Wskazowka*: Wykorzystaj funkcje `putchar`. Aby pisac czytelny kod, uzywaj funkcji pomocniczych.]
#warn[Pamietaj o sprawdzeniu wartosci argumentow na wejsciu!]

== Zadanie 3
Lista jednokierunkowa to jedna z najprostszych struktur danych.
Kazdy element takiej listy zawiera swoje faktyczne dane oraz wskaznik do kolejnego elementu.
Latwy diagram ukazujacy ta strukture wygladalby nastepujaco:
#flow(rgb("a8a8a8"), [Element 1], [Element 2], [Element 3], [Element 4])
Mozemy zdefiniowac jeden element listy jednokierunkowej zawierajacej wartosci typu `int` w nastepujacy sposob:
#codebox[
  ```c
  typedef struct node {
    int value;
    struct node* next;
  } Node;
  ```
]
Listy implementuja nastepujace funkcje, ktore na nich operuja:
- `push_back`/`push_front` - dodaje nowy element na koniec/poczatek listy,
- `pop_back`/`pop_front` - usuwa element z konca/poczatka listy,
- `new_list` - tworzy nowa, pusta liste (*0-elementowa!*)

Jezyk C nie posiada wbudowanych list.
Zaimplementuj prosta liste jednokierunkowa przy uzyciu *wskaznikow*, nastepnie odpowiedz na pytania:
1. Jaki typ operacji `push` i `pop` bedzie szybszy - `_front` czy `_back`? Dlaczego?
2. Czemu mielibysmy uzywac listy zamiast tablic?
3. Jaka bedzie zlozonosc czasowa wszystkich operacji?
