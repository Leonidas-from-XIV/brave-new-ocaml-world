all:
	latexmk slides.tex

watch:
	$(MAKE) all
	while true; do \
		inotifywait -q -e modify *.tex *.sty ; \
		$(MAKE) all ; \
	done
