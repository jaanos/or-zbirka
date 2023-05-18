# Zbirka nalog iz Operacijskih raziskav

* [![](https://github.com/jaanos/or-zbirka/workflows/PDF/badge.svg) **Prenesi zadnjo različico**](https://jaanos.github.io/or-zbirka/pdf/or-zbirka.pdf)
* [**Rešene naloge pri predmetu Operacijske raziskave** - študijsko gradivo za študente 2. letnika Finančne matematike](https://jaanos.github.io/or-zbirka/pdf/or-gradivo.pdf)

Ta zbirka nalog obsega naloge z vaj, kolokvijev in izpitov
pri predmetu Operacijske raziskave od š.l. 2009/10 naprej.

## Licenca

Zbirka nalog je na voljo pod licenčnimi pogoji
[Creative Commons Attribution 4.0 International](LICENSE).

## Orodja

Zbirka je napisana v [LaTeX](https://www.latex-project.org/)u,
za slike pa se uporablja [PGF/Ti*k*Z](https://sourceforge.net/projects/pgf/).

Uporabljajo se sledeči paketi za LaTeX:

* `algorithmicx`
* `algpseudocode`
* `amsmath`
* `amssymb`
* `amstext`
* `babel`
* `babelbib`
* `bookmark`
* `caption`
* `chngcntr`
* `enumerate`
* `environ`
* `eurosym`
* `fontenc`
* `fourier`
* `hyperref`
* `inputenc`
* `lmodern`
* `mathdots`
* `mathtools`
* `microtype`
* `needspace`
* [`omrezja`](https://github.com/jaanos/omrezja)
* `tabularx`
* `tikz`
* `wasysym`
* `xspace`

Glavna datoteka zbirke je [`or-zbirka.tex`](https://github.com/jaanos/or-zbirka/blob/master/or-zbirka.tex).
Za prevedbo v datoteko PDF lahko tako uporabimo `pdflatex`:
```bash
pdflatex or-zbirka.tex
```
Za reference uporabimo `bibtex`:
```bash
bibtex or-zbirka
```
Nato ponovno prevedemo zbirko s `pdflatex`.
Če reference ne delujejo, to ponovimo še enkrat.

Ker zbirka obsega veliko slik,
je prevajanje v PDF lahko dolgotrajno.
V ta namen je pripravljena datoteka [`Makefile`](https://github.com/jaanos/or-zbirka/blob/master/Makefile),
ki s pomočjo orodja [GNU Make](https://www.gnu.org/software/make/)
poskrbi za predhodno prevedbo slik,
zaradi česar se poročilo hitreje prevaja.
Natančnejša navodila so v [`pgf/README.md`](pgf/README.md).

Struktura zbirke je opisana v datoteki [`STRUCTURE.md`](STRUCTURE.md),
kjer so podane tudi smernice za pisanje.

## Prispevki

Trenutno zbirka obsega 251 rešenih nalog.
Tako so trenutno zaželeni prispevki v obliki raznih popravkov
(vsebinskih, slovničnih ali tipkarskih).
Natančnejša navodila so v datoteki [`CONTRIBUTING.md`](CONTRIBUTING.md).
