all: slides.pdf

%.pdf:
	epstopdf --filter < ocaml-logo/Colour/EPS/$(basename $@).eps > $@

facebook.pdf: facebook.svg
	inkscape --without-gui --export-pdf=$@ $(basename $@).svg

citrix.pdf: citrix.svg
	inkscape --without-gui --export-pdf=$@ $(basename $@).svg

camel.pdf: camel.svg
	inkscape --without-gui --export-pdf=$@ $(basename $@).svg

slides.pdf: colour-transparent-logo.pdf colour-transparent-icon.pdf camel.pdf facebook.pdf citrix.pdf slides.tex
	latexmk $(basename $@)

watch:
	$(MAKE) all
	latexmk -pvc slides.tex
