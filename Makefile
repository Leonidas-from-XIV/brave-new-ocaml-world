%.pdf:
	epstopdf --filter < ocaml-logo/Colour/EPS/$(basename $@).eps > $@

slides.pdf: colour-transparent-logo.pdf colour-transparent-icon.pdf slides.tex
	latexmk $(basename $@)

all: slides.pdf

watch:
	$(MAKE) all
	while true; do \
		inotifywait -q -e modify *.tex *.sty ; \
		$(MAKE) all ; \
	done
