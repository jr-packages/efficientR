## $* = filename without extension
## $@ = the output file
## $< = the input file

.SUFFIXES: .tex .pdf .Rnw .R

PKG = efficientTutorial
DIR = vignettes

PRACS = practical1 practical2 practical3
SOLS = solutions2 solutions3
OTHER =
ALL =  $(PRACS)  $(SOLS) $(OTHER)

SOLSPDF = $(SOLS:=.pdf)
PRACSPDF = $(PRACS:=.pdf)
OTHERPDF = $(OTHER:=.pdf)
ALLPDF = $(ALL:=.pdf)

PRACSRNW =  $(PRACS:=.Rnw)
SOLSRNW =  $(SOLS:=.Rnw)

PRACSR =  $(PRACS:=.R)

.PHONY: force sols all clean commit cleaner

force:
	make -C $(DIR) -f ../Makefile solutions

solutions: # $(PRACSPDF)

	$(foreach var, \
		$(PRACSRNW), \
		cp $(var) $(subst practical, solutions, $(var);))

	# Updated to show results
	$(foreach var, \
		$(SOLSRNW), \
		sed -i "5s/.*/results='show';echo=TRUE/" $(var);)

	$(foreach var, \
		$(SOLS), \
		sed -i "1s/.*/%\\\VignetteIndexEntry{$(var)}/" $(var).Rnw;)


install:
	make force
	Rscript -e "roxygen2::roxygenise()"
	R CMD INSTALL .

build:
	make force
	Rscript -e "roxygen2::roxygenise()"
	Rscript -e "devtools::build(vignettes=FALSE)"

check:
	make build
	cd ../ && R CMD check  $(PKG)_*.tar.gz

clean:
	cd $(DIR) && rm -fvr knitr_figure && \
	rm -fv $(ALLPDF)  *.tex *.synctex.gz \
		*.aux *.dvi *.log *.toc *.bak *~ *.blg *.bbl *.lot *.lof \
		*.nav *.snm *.out *.pyc \#*\# _region_* _tmp.* *.vrb \
		Rplots.pdf example.RData d.csv.gz mygraph.* \
		knitr_* knitr.sty .Rhistory ex.data \
		$(PRACSR)

cleaner:
	make clean
	cd $(DIR) && rm -fvr auto/
	cd ../ && rm -fvr $(PKG).Rcheck $(PKG)_*.tar.gz
