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

slike/pretok%.tikz: slike/pretok%-osnova.tikz

slike/pretok1%.tikz: slike/pretok1-osnova.tikz

slike/pretok2%.tikz: slike/pretok2-osnova.tikz

slike/pretok3%.tikz: slike/pretok3-osnova.tikz

slike/pretok4%.tikz: slike/pretok4-osnova.tikz

slike/pretok5%.tikz: slike/pretok5-osnova.tikz
