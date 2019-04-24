SHELL := /bin/bash
ZBIRKA := or-zbirka

TEX_FILES := $(shell ls naloge/*.tex tex/*.tex)
FIG_FILES := $(shell ls slike/*.tikz | grep -v osnova | sed -r "s|^slike/(.*)\\.tikz|pgf/\\1.pdf|")
BIB_FILES := reference.bib slovene.bdf

all: zbirka

zbirka: $(ZBIRKA).pdf

tikz: $(FIG_FILES)

$(ZBIRKA).pdf: $(ZBIRKA).tex $(ZBIRKA).bbl $(FIG_FILES) $(TEX_FILES) $(BIB_FILES)
	pdflatex $(ZBIRKA).tex

$(ZBIRKA).bbl: $(BIB_FILES)
	pdflatex $(ZBIRKA).tex
	bibtex $(ZBIRKA)
	pdflatex $(ZBIRKA).tex

pgf/%.pdf: slike/%.tikz
	pdflatex --jobname=pgf/$* $(ZBIRKA).tex

pgf/%.pdf: slike/%-osnova.tikz

pgf/%-resitev.pdf: slike/%-osnova.tikz

pgf/pretok1%.pdf: slike/pretok1-osnova.tikz

pgf/pretok2%.pdf: slike/pretok2-osnova.tikz

pgf/pretok3%.pdf: slike/pretok3-osnova.tikz

pgf/pretok4%.pdf: slike/pretok4-osnova.tikz

pgf/pretok5%.pdf: slike/pretok5-osnova.tikz
