all: slides.pdf

%.pdf:
	epstopdf --filter < ocaml-logo/Colour/EPS/$(basename $@).eps > $@

camel.pdf: camel.svg
	inkscape --without-gui --export-pdf=$@ $(basename $@).svg

slides.pdf: colour-transparent-logo.pdf colour-transparent-icon.pdf camel.pdf slides.tex
	latexmk $(basename $@)

watch:
	$(MAKE) all
	while true; do \
		inotifywait -q -e modify *.tex *.sty ; \
		$(MAKE) all ; \
	done
