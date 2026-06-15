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
  #text(size: 14pt, fill: rgb("a8a8a8"))[Lista 2]
]

#v(1.5em)

#tracker(3, (), starred: (3,))

== Zadanie 1
Rozwazmy nastepujace zapisy petli:
#codebox[
  ```c
  for (;;) { ... }

  while(true) { ... }

  for (;;++x) { ... }

  for (;i<10;i++) { ... }

  while (true) { ...; x++; }

  for (;(i++)<10;) { ... }
  ```
]
1. Polacz ze soba pary petli, ktore zachowuja sie identycznie.
2. Jak mozna by zdefiniowac petle `for` gdyby nie istniala w skladni jezyka C?
3. Jakiego koncowego typu musi byc wyrazenie zawarte po srodku petli `for`?
#hint[*Wskazowka do punktu 2*: Zbuduj ja przy uzyciu petli `while`.]
#hint[*Wskazowka do punktu 3*: To warunek, tak samo jak `while`.]

== Zadanie 2
Elementy tablicy w pamieci sa ustawione obok siebie. Pozwala to na nietypowe operacje na nich, przy uzyciu wskaznikow. \
Wskazniki to tak wlasciwie liczby, bedace adresami. Mozemy wiec do nich dodawac i od nich odejmowac. \
Poprawna operacja zatem jest cos takiego:
#codebox[
  ```c
  int* ptr = &x;
  ptr++;
  ```
]
Wydrukuje to oczywiscie smieci. \
Ale co jezeli bedziemy mieli zapisana tablice, np:
#codebox[
  ```c
  int i[] = {6, 9};
  int* ptr = i;
  ptr++;
  ```
]
Przed inkrementacja `ptr` wskazuje na pierwszy element tablicy, czyli na `6`. \
Po inkrementacji pod wskaznikiem znajduje sie `9`. \
Korzystajac z nabytej wiedzy, zaimplementuj algorytm mnozenia dwoch macierzy bez uzycia wyrazen typu `tab[i]`.
#hint[*Wskazowka*: Iteracja przez tablice jest mozliwa przez inkrementacje wskaznika. Dostep do elementu jest poprzez *dereferencje wskaznika* (`*ptr`)]

== Zadanie 3
Rozwazmy nastepujaca funkcje:
#codebox[
  ```c
  unsigned int magic(char* str, char ch) {
    unsigned int i = 0;
    for (char* curr = str;*(curr++) != '\0';)
      i += (*curr == ch);

    return i;
  }
  ```
]
Odpowiedz na nastepujace pytania:
1. Co robi ta funkcja?
2. Ta funkcja *nie* jest bezpieczna. Dlaczego?
3. Co mozna zrobic aby sprawic, zeby ta funkcja byla bezpieczna w uzytku? Napisz jej bezpieczna implementacje.
#hint[*Wskazowka do punktu 1*: Ta funkcja specjalnie jest napisana w chujowy sposob. Sprobuj ja najpierw rozlozyc na troche czytelniejsza forme.]
#hint[*Wskazowka do punktu 2 i 3*: To ten sam problem, ktory ma funkcja `gets` zawarta w bibliotece standardowej. `fgets` to jej bezpieczna implementacja.]

