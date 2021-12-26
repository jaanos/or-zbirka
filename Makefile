SHELL := /bin/bash
ZBIRKA := or-zbirka

TEX_FILES := $(shell ls naloge/*.tex tex/*.tex)
FIG_FILES := $(shell ./getfigs.sh)
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

pgf/%.pdf: slike/%.tikz
	$(call pgfc,$*)

pgf/bf.pdf: slike/bf.tikz slike/dijkstra-bf-osnova.tikz
	$(call pgfc,bf)

pgf/cmrlji.pdf: slike/cmrlji.tikz slike/cmrlji-osnova.tikz
	$(call pgfc,cmrlji)

pgf/cmrlji-resitev.pdf: slike/cmrlji-resitev.tikz slike/cmrlji-osnova.tikz
	$(call pgfc,cmrlji-resitev)

pgf/dectree.pdf: slike/dectree.tikz slike/dectree-osnova.tikz
	$(call pgfc,dectree)

pgf/dectree-resitev.pdf: slike/dectree-resitev.tikz slike/dectree-osnova.tikz
	$(call pgfc,dectree-resitev)

pgf/dectree2.pdf: slike/dectree2.tikz slike/dectree2-osnova.tikz
	$(call pgfc,dectree2)

pgf/dectree2-resitev.pdf: slike/dectree2-resitev.tikz slike/dectree2-osnova.tikz
	$(call pgfc,dectree2-resitev)

pgf/dectree3.pdf: slike/dectree3.tikz slike/dectree3-osnova.tikz
	$(call pgfc,dectree3)

pgf/dectree3-resitev.pdf: slike/dectree3-resitev.tikz slike/dectree3-osnova.tikz
	$(call pgfc,dectree3-resitev)

pgf/dectree4.pdf: slike/dectree4.tikz slike/dectree4-osnova.tikz
	$(call pgfc,dectree4)

pgf/dectree4-resitev.pdf: slike/dectree4-resitev.tikz slike/dectree4-osnova.tikz
	$(call pgfc,dectree4-resitev)

pgf/dijkstra.pdf: slike/dijkstra.tikz slike/dijkstra-bf-osnova.tikz
	$(call pgfc,dijkstra)

pgf/divjizur%.pdf: slike/divjizur%.tikz slike/divjizur-osnova.tikz
	$(call pgfc,divjizur$*)

pgf/domine.pdf: slike/domine.tikz slike/domine-osnova.tikz
	$(call pgfc,domine)

pgf/domine-resitev.pdf: slike/domine-resitev.tikz slike/domine-osnova.tikz
	$(call pgfc,domine-resitev)

pgf/greedyflow.pdf: slike/greedyflow.tikz slike/greedyflow-osnova.tikz
	$(call pgfc,greedyflow)

pgf/greedyflow-resitev.pdf: slike/greedyflow-resitev.tikz slike/greedyflow-osnova.tikz
	$(call pgfc,greedyflow-resitev)

pgf/kri%.pdf: slike/kri%.tikz slike/kri-osnova.tikz
	$(call pgfc,kri$*)

pgf/minmaxpretok.pdf: slike/minmaxpretok.tikz slike/minmaxpretok-osnova.tikz
	$(call pgfc,minmaxpretok)

pgf/minmaxpretok%.pdf: slike/minmaxpretok%.tikz slike/minmaxpretok-osnova.tikz
	$(call pgfc,minmaxpretok$*)

pgf/optika.pdf: slike/optika.tikz slike/optika-osnova.tikz
	$(call pgfc,optika)

pgf/optika-resitev.pdf: slike/optika-resitev.tikz slike/optika-osnova.tikz
	$(call pgfc,optika-resitev)

pgf/otoki.pdf: slike/otoki.tikz slike/otoki-osnova.tikz
	$(call pgfc,otoki)

pgf/otoki-resitev.pdf: slike/otoki-resitev.tikz slike/otoki-osnova.tikz
	$(call pgfc,otoki-resitev)

pgf/poslovnez.pdf: slike/poslovnez.tikz slike/poslovnez-osnova.tikz
	$(call pgfc,poslovnez)

pgf/poslovnez%.pdf: slike/poslovnez%.tikz slike/poslovnez-osnova.tikz
	$(call pgfc,poslovnez$*)

pgf/pretok%.pdf: slike/pretok%.tikz slike/pretok%-osnova.tikz
	$(call pgfc,pretok$*)

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

pgf/pretokx%.pdf: slike/pretokx%.tikz slike/pretokx-osnova.tikz
	$(call pgfc,pretokx$*)

pgf/rovi.pdf: slike/rovi.tikz slike/rovi-osnova.tikz
	$(call pgfc,rovi)

pgf/rovi%.pdf: slike/rovi%.tikz slike/rovi-resitev-osnova.tikz slike/rovi-osnova.tikz
	$(call pgfc,rovi$*)

pgf/strezniki%.pdf: slike/strezniki%.tikz slike/strezniki-osnova.tikz
	$(call pgfc,strezniki$*)

pgf/terminali.pdf: slike/terminali.tikz slike/terminali-osnova.tikz
	$(call pgfc,terminali)

pgf/terminali%.pdf: slike/terminali%.tikz slike/terminali-osnova.tikz
	$(call pgfc,terminali$*)

pgf/zajetje.pdf: slike/zajetje.tikz slike/zajetje-osnova.tikz
	$(call pgfc,zajetje)

pgf/zajetje%.pdf: slike/zajetje%.tikz slike/zajetje-osnova.tikz
	$(call pgfc,zajetje$*)
