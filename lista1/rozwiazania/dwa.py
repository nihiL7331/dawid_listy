# pewnego razu urban szed do lasu i zostal wyruchany za wczasu
class kolejka:
    def __init__(self):
        self.items = []

    def enqueue(self, item):
        self.items.append(item)

    def dequeue(self):
        if self.items:
            return self.items.pop(0)
        return None


infolajn = kolejka()
oblodzeni = []
with open("infolinia.txt", "r") as f:
    for lajn in f:
        lajn = lajn.strip()
        if not lajn:
            continue

        if lajn.startswith("ZGLOSZENIE:"):
            imie = lajn.split(":", 1)[1].strip()
            infolajn.enqueue(imie)
        elif "KONSULTANT_WOLNY" in lajn:
            cwel = infolajn.dequeue()
            if cwel:
                oblodzeni.append(f"Rozmowa z: {cwel}")
            else:
                oblodzeni.append("Brak klientow, konsultant pije piwo.")

with open("oblsuzeni.txt", "w") as f:
    for lajn in oblodzeni:
        f.write(lajn + "\n")

print(f"liczba osob w kolejce: {len(infolajn.items)}")
# https://pl.pinterest.com/pin/606860118584042334/
