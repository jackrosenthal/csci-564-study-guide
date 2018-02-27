NAME=exam1-study-guide
DEPENDS=basic-pipeline.png

.PHONY: all
all: $(NAME).pdf $(NAME).html

$(NAME).html: $(NAME).rst $(DEPENDS)
	rst2html --math-output "MathJax https://mastergo.mines.edu/common/MathJax/MathJax.js" $< > $@

$(NAME).pdf: $(NAME).tex
	xelatex $<

$(NAME).tex: $(NAME).rst xelatex.tex re.php $(DEPENDS)
	rst2xetex --template=xelatex.tex --literal-block-env=Verbatim --documentoptions="letterpaper,10pt" $< | php re.php > $@
