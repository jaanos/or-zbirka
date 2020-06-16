# Struktura

Zbirka nalog se generira iz sledečih datotek:

* [`or-zbirka.tex`](https://github.com/jaanos/or-zbirka/blob/master/or-zbirka.tex): glavna datoteka zbirke
* [`test.tex.template`](https://github.com/jaanos/or-zbirka/blob/master/test.tex.template):
    predloga za [testiranje](#testiranje)
* [`reference.bib`](https://github.com/jaanos/or-zbirka/blob/master/reference.bib): bibliografija v obliki BibTeX
* [`slovene.bdf`](https://github.com/jaanos/or-zbirka/blob/master/slovene.bdf): slovenski prevodi za `babelbib`
* [`omrezja.sty`](https://github.com/jaanos/omrezja):
    knjižnica za risanje omrežij
    (potrebna je [ročna nastavitev](CONTRIBUTING.md#večji-popravki))
* [`tex/`](https://github.com/jaanos/or-zbirka/blob/master/tex/): pomožne datoteke (uvoz paketov, definicije funkcij)
* [`naloge/`](https://github.com/jaanos/or-zbirka/blob/master/naloge/): datoteke z [nalogami](#naloge)
* [`slike/`](https://github.com/jaanos/or-zbirka/blob/master/slike/): datoteke s [slikami](#slike)
* [`pgf/`](pgf/): mapa za prevedene slike

## Naloge

V mapi [`naloge/`](https://github.com/jaanos/or-zbirka/blob/master/naloge/) se nahajajo naloge, vsaka v svoji datoteki.
Vsaka naloga ima sledečo strukturo:
```LaTeX
\begin{naloga}[Naslov]{Avtor}{Vir}
\begin{vprasanje}
Besedilo naloge
\end{vprasanje}

\begin{odgovor}
Besedilo rešitve
\end{odgovor}
\end{naloga}
```
Ime datoteke z nalogo (brez končnice `.tex`) je tudi ime,
s katerim je mogoče [sklicevanje](#sklicevanje) na nalogo
ter njeno rešitev, slike in tabele.
Razporeditev nalog po poglavjih je določena z datotekami v mapi [`tex/`](https://github.com/jaanos/or-zbirka/blob/master/tex/)
(datoteka [`tex/seznam.tex`](https://github.com/jaanos/or-zbirka/blob/master/tex/seznam.tex) določa poglavja).

Kot je razvidno iz zgornjega primera,
je naslov pri nalogi neobvezen in se ga lahko izpusti.

## Slike

V mapi [`slike/`](https://github.com/jaanos/or-zbirka/blob/master/slike/) so zbrane slike,
večinoma opisane v jeziku PGF/Ti*k*Z.
V večini primerov je ime datoteke s sliko (brez končnice `.tikz`)
enako imenu naloge, ki ji pripada.
V primeru, ko nalogi pripada več slik, je ime lahko tudi drugačno,
a naj se začne z imenom naloge
(npr. če ima `naloga` eno sliko v vprašanju in drugo v rešitvi,
je lahko druga v datoteki `slike/naloga-resitev.tikz`).

Sliko v nalogo vključimo tako:
```LaTeX
\begin{slika}[postavitev]
\pgfslika[slika]
\podnaslov[sklic]{Opis slike}
\end{slika}
```
Okolje `slika` ima neobvezen argument za postavitev -
gre za neobvezen parameter k LaTeXovemu okolju `figure`
s privzeto vrednostjo `t!` (tj., slika se postavi na vrh strani).

Ukaz `\pgfslika` vključi sliko v datoteki `.tikz` z imenom,
podanim z neobveznim argumentom
(oziroma ustrezno prevedeno sliko v mapi [`pgf/`](pgf/)).
S tem imenom se je mogoče [sklicevati](#sklicevanje) na sliko.
Če ime ni podano, se uporabi ime trenutne naloge.
Namesto ukaza `\pgfslika` se lahko slika vključi tudi na druge načine,
npr. z `\includegraphics`.
Če je slika preširoka, se lahko uporabi `\makebox` za ustrezno postavitev.

Ukaz `\podnaslov` vstavi napis pod sliko v obliki
*`Opis slike` za nalogo `sklic`.*
Če neobvezni sklic ni podan,
se izpiše sklic na trenutno nalogo oziroma rešitev.
Namesto ukaza `\podnaslov` se lahko uporabi
tudi LaTeXov ukaz `\caption`,
s katerim lahko nastavimo poljuben napis.

V primerih, ko želimo imeti več variant iste slike
(npr. graf v besedilu naloge in njegova dopolnitev v rešitvi),
je mogoče osnovno sliko imeti v svoji datoteki,
ki naj pa vsebuje besedo `osnova` (npr. `slike/naloga-osnova.tikz`).
Tako datoteko se lahko vključi z ukazom `\input`.
V primeru dodajanja take datoteke
je potrebno še posodobiti [`Makefile`](https://github.com/jaanos/or-zbirka/blob/master/Makefile),
da se zabeleži ustrezna odvisnost med datotekami.

## Tabele

Podobno kot slike je mogoče dodati tudi tabele,
na katere je možno sklicevanje, npr.
```LaTeX
\begin{tabela}[postavitev]
\begin{tabular}{c|cc}
...
\end{tabular}
\podnaslov[sklic]{Opis tabele}
\end{tabela}
```
Okolje `tabela` deluje podobno kot okolje `slika` -
neobvezni argument za postavitev (s privzeto vrednostjo `t!`)
se poda k LaTeXovemu okolju `table`.
Na tabelo se [sklicujemo](#sklicevanje) z imenom trenutne naloge,
lahko pa znotraj okolja `tabela`
z ukazom `\setlabel` nastavimo tudi drugačno oznako.

## Sklicevanje

Za sklicevanje so na voljo naslednji ukazi:

* `\nal[oznaka]` - naloga s podano oznako,
* `\res[oznaka]` - rešitev naloge s podano oznako,
* `\fig[oznaka]` - slika s podano oznako, in
* `\tab[oznaka]` - tabela s podano oznako.

Pri vseh zgornjih funkcijah je oznaka neobvezen argument -
če ni podana, se uporabi ime trenutne naloge.
Slike in tabele imajo lahko iste oznake kot naloge
(pravzaprav je tako privzeto).

Zgornji ukazi uporabljajo funkcijo `\xspace`,
ki poskusi poskrbeti za ustrezno vstavljanje presledka po sklicu.
Ker se pa včasih vstavi presledek, ko ta ni zaželen,
lahko za sklic postavimo še `{}`,
da se presledek ne izpiše
(npr. `\nal{}(a)` za sklic na točko (a) trenutne naloge).

## Drugo

Tukaj je še nekaj napotkov za pisanje rešitev.

* Za ločilo decimalk se uporablja pika (`.`).
  Za ločilo tisočic se uporablja kratek presledek
  (`\,` v matematičnem načinu).
* Algoritmi se pišejo v psevdokodi z uporabo okolja `algorithmic`.
  - Enočrkovne spremenljivke se pišejo v matematičnem načinu.
  - Besedne spremenljivke se pišejo s poševnimi črkami (`{\sl ...}`).
  - Imena funkcij se pišejo z malimi inicialkami (`{\sc ...}`)
    z velikimi začetnicami besed (CamelCase).
    Pri podajanju imena funkcije v `\Function` uporaba `\sc` ni potrebna.
  - Imena metod se pišejo z običajnimi črkami -
    v matematičnem načinu se lahko v ta namen uporablja `\operatorname{...}`.
  - Za logični konstanti v psevodkodi
    sta definirana ukaza `\True` in `\False`.
  - Za prazno vrednost se uporablja `\Null`,
    za funkcijo, ki ne naredi ničesar, pa `\NOp`.
  - Definirani so tudi ukazi za pogoste operacije na podatkovnih strukturah:
    `\length`, `\isEmpty`, `\append`, `\pop`, `\push`, `\reverse`.
  - Grafi se v specifikaciji vhoda algoritma navajajo
    v obliki *G* = (*V*, *E*) -
    potem se lahko v algoritmu sklicujemo na množici *V* in *E*.
    Za soseščino vozlišča je definiran ukaz `\Adj`
    (npr. `\Adj(G, u)` za sosede vozlišča *u* v grafu *G*).
  - Predpostavljamo, da se standardni algoritmi na grafih obnašajo tako,
    kot ste jih spoznali na predavanjih in vajah - koda je na voljo na
    [repozitoriju predmeta](https://github.com/jaanos/operacijske-raziskave/tree/master/vaje/Grafi).

## Testiranje

Zaradi velike količine slik je prevajanje zbirke dolgotrajen proces
(možno ga je sicer skrajšati s predhodnim prevajanjem slik,
glej [`pgf/README.md`](pgf/README.md)).
V ta namen je v repozitoriju datoteka
[`test.tex.template`](https://github.com/jaanos/or-zbirka/blob/master/test.tex.template),
ki služi kot predloga za testiranje posamezne naloge.
Te datoteke ne spreminjamo, pač pa jo lahko skopiramo v `test.tex`
(vnos v `.gitignore` bo preprečil njeno dodajanje na git)
in tam popravimo definicijo ukaza `\testnaNaloga` na ime želene naloge:
```LaTeX
\newcommand{\testnaNaloga}{naloga}
```
Pri prevajanju s `pdflatex` bo v `test.pdf`
prikazana samo izbrana naloga skupaj s svojo rešitvijo.
