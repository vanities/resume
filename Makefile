.PHONY: pdf

pdf:
	pdflatex --interaction=nonstopmode main.tex;

cover:
	/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf coverletter.odt
