%.pdf:
	ps2pdf ocaml-logo/Colour/EPS/$(basename $@).eps $@
	pdfcrop $@ $@

slides.pdf: colour-transparent-logo.pdf colour-transparent-icon.pdf slides.tex
	latexmk $(basename $@)

all: slides.pdf

watch:
	$(MAKE) all
	while true; do \
		inotifywait -q -e modify *.tex *.sty ; \
		$(MAKE) all ; \
	done
