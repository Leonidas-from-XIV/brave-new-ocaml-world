%.pdf:
	ps2pdf ocaml-logo/Colour/EPS/$(basename $@).eps $@
	pdfcrop $@ $@

slides.tex: colour-transparent-logo.pdf colour-transparent-icon.pdf
	latexmk $@

all: slides.tex

watch:
	$(MAKE) all
	while true; do \
		inotifywait -q -e modify *.tex *.sty ; \
		$(MAKE) all ; \
	done
