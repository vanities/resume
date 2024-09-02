.PHONY: pdf

odt_file = coverletter.odt
pdf_file = coverletter.pdf
position = Fullstack Software Engineer
company = Coinbase
new_pdf = $(company)-$(position).pdf

resume:
	pdflatex --interaction=nonstopmode main.tex;

cover:
	mkdir -p tmp
	unzip "$(odt_file)" -d "tmp"
	sed "s|\[position\]|$(position)|g" "tmp/content.xml" > "tmp/content.xml.tmp"
	mv "tmp/content.xml.tmp" "tmp/content.xml"
	sed "s|\[company\]|$(company)|g" "tmp/content.xml" > "tmp/content.xml.tmp"
	mv "tmp/content.xml.tmp" "tmp/content.xml"
	cd "tmp" && zip -r "$(odt_file)" * && /Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf coverletter.odt && mv "$(pdf_file)" "../$(new_pdf)"
	rm -rf "tmp"
	@echo "Words replaced successfully in $(new_pdf)"

references:
	/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf references.odt
