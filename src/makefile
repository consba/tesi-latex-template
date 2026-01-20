TEX = pdflatex
BIB = biber

SRC = tesi.tex
BCF = tesi
PDF = tesi.pdf

.PHONY: all build publish step clean distclean

all: build

build:
	$(TEX) -interaction=nonstopmode $(SRC) || true
	$(BIB) $(BCF) || true
	$(TEX) -interaction=nonstopmode $(SRC) || true
	$(TEX) -interaction=nonstopmode $(SRC)

publish: build clean

step:
	$(TEX) -interaction=nonstopmode $(SRC)

clean:
	@rm -f *.aux *.log *.toc *.run.xml *.bbl *.blg *.bcf \
		*.fdb_latexmk *.fls *.idx *.ilg *.ind *.lof *.lot *.out \
		*.synctex.gz *~ *.backup
	@echo "File temporanei rimossi."

distclean: clean
	@rm -f $(PDF)
	@echo "PDF rimosso."
