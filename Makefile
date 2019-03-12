SHELL := /bin/bash
ZBIRKA := or-zbirka

TEX_FILES := $(shell ls naloge/*.tex)
FIG_FILES := $(shell ls slike/*.tikz | sed -r "s|^slike/(.*)\\.tikz|fig-\\1.pdf|")
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

fig-%.pdf: slike/%.tikz
	pdflatex --jobname=fig-$* $(ZBIRKA).tex
