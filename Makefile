# Replace with your filename first.
# Error may occurs if no cite found in `.aux`.
# Make sure your `\nocite{*}` in `.tex` if there is no cite.

OPENING=opening
TRANSLATION=translation
THESIS=thesis

all: opening translation thesis

opening: $(OPENING).pdf

translation: $(TRANSLATION).pdf

thesis: $(THESIS).pdf

# # # # # # # # # # #
# if there is no bib #
# # # # # # # # # # #
nobiball: nobibopening nobibtranslation nobibthesis

nobibopening: $(OPENING).tex
	xelatex $(OPENING).tex

nobibtranslation: $(TRANSLATION).tex
	xelatex $(TRANSLATION).tex

nobibthesis: $(THESIS).tex
	xelatex $(THESIS).tex
# # # # # # # # # # #
# if there is no bib #
# # # # # # # # # # #

$(OPENING).pdf: $(OPENING).tex $(OPENING).bib
	xelatex $(OPENING).tex
	bibtex $(OPENING).aux
	xelatex $(OPENING).tex
	xelatex $(OPENING).tex
$(TRANSLATION).pdf: $(TRANSLATION).tex $(TRANSLATION).bib
	xelatex $(TRANSLATION).tex
	bibtex $(TRANSLATION).aux
	xelatex $(TRANSLATION).tex
	xelatex $(TRANSLATION).tex
$(THESIS).pdf: $(THESIS).tex $(THESIS).bib
	xelatex $(THESIS).tex
	bibtex $(THESIS).aux
	xelatex $(THESIS).tex
	xelatex $(THESIS).tex

clean:
	rm -rf *.aux *.bbl *.blg *.log *.pdf *.toc *.out
