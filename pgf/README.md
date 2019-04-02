# Mapa s prevedenimi slikami

V tej mapi se zbirajo prevedene slike,
ki tako omogočajo hitrejše prevajanje zbirke.

Sliko je mogoče prevesti z ukazom
```bash
pdflatex --jobname=imeslike or-zbirka.tex
```
`imeslike` je tukaj ime slike,
podano kot neobvezni argument funkcije `\pgfslika`.
Če ime ni podano, je enako imenu naloge.
Enkrat, ko se slika prevede,
se pri prevajanju zbirke uporabi že prevedena slika,
tudi, če se je izvorna koda slike spremenila.
V tem primeru je potrebno sliko znova prevesti.

To si lahko olajšamo z uporabo [GNU Make](https://www.gnu.org/software/make/).
Ukaz
```bash
make
```
poskrbi za prevajanje vseh slik,
ki še niso prevedene oziroma so se od zadnjega prevajanja spremenila,
ter za prevajanje poročila z na novo prevedenimi slikami.
