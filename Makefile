LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

MAIN=CMOS-rad
SOURCES=$(MAIN).tex Makefile
# FIGURES := $(shell find figures/* images/* -type f)

all:    $(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES)
		$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
			-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

force:
		touch .refresh
		rm $(MAIN).pdf
		$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
			-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
		$(LATEXMK) -C $(MAIN)
		rm -f $(MAIN).pdfsync
		rm -rf *~ *.tmp _minted-$(MAIN)
		rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk *.out.ps .refresh *.gz

once:
		$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug:
		$(LATEX) $(LATEXOPT) $(MAIN)

.PHONY: clean force once all