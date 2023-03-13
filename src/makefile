TEX = latex
BIB = biber

src = tesi.tex
bcf = tesi

PDF = tesi.pdf

publish :
	$(TEX) $(src) && $(BIB) $(bcf) && $(TEX) $(src) && $(TEX) $(src) && rm *.aux *.log *.toc *.run.xml *.bbl *.blg *.bcf *.fdb_latexmk *.fls *.idx *.ilg *.ind *.lof *.lot *.out

build :
	$(TEX) $(src) && $(BIB) $(bcf) && $(TEX) $(src) && $(TEX) $(src)

step :
	$(TEX) $(src)

.PHONY: clean
clean :
	rm *.aux *.log *.toc *.run.xml *.bbl *.blg *.bcf *.fdb_latexmk *.fls *.idx *.ilg *.ind *.lof *.lot *.pdf *.out
