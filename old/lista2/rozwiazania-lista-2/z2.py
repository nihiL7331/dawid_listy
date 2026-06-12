from datetime import datetime

logs = []
with open("server_logs.txt", "r") as f:
    for l in f:
        l = l.strip().split(";")
        logs.append(l)


# 0ts 1ip 2ep 3rest 4stat
def sredni_czas(logs):
    koncopunktniki = {}
    for wiersz in logs:
        endpoint = wiersz[2]
        czas = int(wiersz[3])
        if endpoint not in koncopunktniki:
            koncopunktniki[endpoint] = [0, 0]
        koncopunktniki[endpoint][0] += czas
        koncopunktniki[endpoint][1] += 1
    srednie = {}
    for endpoint, dane in koncopunktniki.items():
        czasy = dane[0]
        licznik = dane[1]
        srednie[endpoint] = czasy / licznik
    return srednie


def licznik_bledow(
    logs,
):  # prawdopodobnie najwiekszy zostal zaliczony gdzies okolo xx-03-2007 roku ale kto to wie
    godziny = [0] * 24
    for wiersz in logs:
        if wiersz[4] == "418":
            dt = datetime.fromisoformat(wiersz[0])
            godziny[dt.hour] += 1
    return godziny


def top_turi_ip_ip_ip_ip(logs):
    top = 5
    statysyki = {}
    for wiersz in logs:
        ip = wiersz[1]
        czas = int(wiersz[3])
        statysyki[ip] = statysyki.get(ip, 0) + czas
    posortowane = sorted(statysyki.items(), key=lambda x: x[1], reverse=True)
    return posortowane[:top]


with open("stats.txt", "w") as f:
    srednie = sredni_czas(logs)
    for ep, srednia in srednie.items():
        f.write(f"{ep}: {srednia}\n")

    urbany = licznik_bledow(logs)
    for godzina, ilosc in enumerate(urbany):
        f.write(f"{godzina} {ilosc}\n")

    top_ip = top_turi_ip_ip_ip_ip(logs)
    for i, (ip, suma) in enumerate(top_ip, 1):
        f.write(f"{i} {ip} {suma}\n")


# Jak on ma poczekaj... Jak on ma.. Amonra taki gość, słuchaj Amonra siedzisz se z dziewczyną Amonra. Siedzisz sie z dziewczyną w lokalu Amonra , Amonra kutasra, srarara nie wiem Wiesiek, Zbigniew, Karol, kurwa nie wiem, Andrzej siedzisz se w lokalu z dziewczyną i z 10 - 20 kolegami, podchodzi gość do Ciebie odpina sobie koszu ten bluzke pokazuje w koszulecce ten pokazuje ci koronke , twoi jeden JEDEN z twoich kolegów był kiedyś w kryminale, siedział, i on mu mówi hmm twoi koledzy wstają, jadą Cię w dziurę twoja kobita wstaje, pfu pluje na Ciebie, i wszyscy od Ciebie odchodzą, a Ty takich ludzi nie szanujesz? Takie jest życie, to jest w przenośni, bajka, zabawa, gra. Mówcie sobie co chcecie. A on mówi mam w cipce takiego gośśścia. To miej se go w cipce, miej se go w cipce. Życie i tak weryfikuje wszystko
