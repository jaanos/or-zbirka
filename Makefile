SHELL := /bin/bash
ZBIRKA := or-zbirka

TEX_FILES := $(shell ls naloge/*.tex tex/*.tex)
FIG_FILES := $(shell ls slike/*.tikz | grep -v osnova | sed -r "s|^slike/(.*)\\.tikz|pgf/\\1.pdf|")
BIB_FILES := reference.bib slovene.bdf

pgfc = pdflatex --jobname=pgf/$1 $(ZBIRKA).tex

all: zbirka

zbirka: $(ZBIRKA).pdf

tikz: $(FIG_FILES)

$(ZBIRKA).pdf: $(ZBIRKA).tex $(ZBIRKA).bbl $(FIG_FILES) $(TEX_FILES) $(BIB_FILES)
	pdflatex $(ZBIRKA).tex

$(ZBIRKA).bbl: $(BIB_FILES)
	pdflatex $(ZBIRKA).tex
	bibtex $(ZBIRKA)
	pdflatex $(ZBIRKA).tex

pgf/%.pdf: slike/%.tikz slike/%-osnova.tikz
	$(call pgfc,$*)

pgf/%-resitev.pdf: slike/%-resitev.tikz slike/%-osnova.tikz
	$(call pgfc,$*-resitev)

pgf/pretok1%.pdf: slike/pretok1%.tikz slike/pretok1-osnova.tikz
	$(call pgfc,pretok1$*)

pgf/pretok2%.pdf: slike/pretok2%.tikz slike/pretok2-osnova.tikz
	$(call pgfc,pretok2$*)

pgf/pretok3%.pdf: slike/pretok3%.tikz slike/pretok3-osnova.tikz
	$(call pgfc,pretok3$*)

pgf/pretok4%.pdf: slike/pretok4%.tikz slike/pretok4-osnova.tikz
	$(call pgfc,pretok4$*)

pgf/pretok5%.pdf: slike/pretok5%.tikz slike/pretok5-osnova.tikz
	$(call pgfc,pretok5$*)
