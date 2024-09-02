.PHONY: pdf

odt_file = coverletter.odt
position = Fullstack Software Engineer
company = Coinbase

resume:
	pdflatex --interaction=nonstopmode main.tex;

cover:
	temp_dir=$$(mktemp -d)
	unzip "$(odt_file)" -d "$$temp_dir"
	sed -i "s/\[position\]/$(position)/g" "$$temp_dir/content.xml"
	sed -i "s/\[company\]/$(company)/g" "$$temp_dir/content.xml"
	cd "$$temp_dir" && zip -r "$(odt_file)" *
	cd - && rm -rf "$$temp_dir"
	@echo "Words replaced successfully in $(odt_file)"
	/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf coverletter.odt

references:
	/Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf references.odt
