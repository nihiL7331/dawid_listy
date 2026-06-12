class kolejka:
    def __init__(self):
        self.items = []

    def enqueue(
        self, item
    ):  # bardziej skomplikowanego slowa kurwa nie bylo do napisania
        self.items.append(item)

    def dequeue(self):
        if self.items:
            return self.items.pop(0)
        return None


drukenkolejken = kolejka()


def dodaj_dokument(nazwa):
    drukenkolejken.enqueue(nazwa)


def drukuj_dokumnet():
    dokuemnt = drukenkolejken.dequeue()
    if dokuemnt:
        print(f"Drukowanie: {dokuemnt}")
    else:
        print("zawartos glowy urbana")


def status_drukarki():
    print(f"w duparce jest: {len(drukenkolejken.items)}")


dodaj_dokument("ileKrzysztofWydalNaSwojegoBekarta.pdf")
dodaj_dokument("NagieZdjeciaUrbana.jpg")
status_drukarki()
drukuj_dokumnet()
status_drukarki()
