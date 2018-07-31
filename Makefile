PDFLATEX = pdflatex
BIBTEX = bibtex
BUILD = .build

pdf_src=$(wildcard differentials/figs/*.pdf)

notes-info:
	@echo "$(pdf_src)"

differentials: differentials/main.pdf
old-ideas: old-ideas/main.pdf

differentials/main.pdf: differentials/main.tex differentials/*.tex bib/*.bib $(pdf_src)
	mkdir -p differentials/$(BUILD)
	ln -sf bibs/refs.bib differentials/$(BUILD)/refs.bib
	cd "$(dir $(<))" ;\
	$(PDFLATEX) -file-line-error -output-directory=$(BUILD)/ "$(notdir $(<))" ;
	cd $(BUILD) ; $(BIBTEX) main || true ;
	cd "$(dir $(<))" ;\
	$(PDFLATEX) -file-line-error -output-directory=$(BUILD)/ "$(notdir $(<))" ;
	cp -f $(BUILD)/main.pdf "$(dir $(<))"

old-ideas/main.pdf: old-ideas/main.tex old-ideas/*.tex bib/*.bib $(pdf_src)
	mkdir -p old-ideas/$(BUILD)
	ln -sf bibs/refs.bib old-ideas/$(BUILD)/refs.bib
	cd "$(dir $(<))" ;\
	$(PDFLATEX) -file-line-error -output-directory=$(BUILD)/ "$(notdir $(<))" ;
	cd $(BUILD) ; $(BIBTEX) main || true ;
	cd "$(dir $(<))" ;\
	$(PDFLATEX) -file-line-error -output-directory=$(BUILD)/ "$(notdir $(<))" ;
	cp -f $(BUILD)/main.pdf "$(dir $(<))"
