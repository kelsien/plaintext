SRC_DIR = src/markdown/
SOURCE_DOCS := $(wildcard $(SRC_DIR)*/*.md)

# RevealsJS
REVEALJS_DIST_DIR = dist/html/
REVEALJS_DIST_DOCS := $(wildcard $(REVEALJS_DIST_DIR)*/*.html)

# PDF
PDF_DIST_DIR = dist/pdf/
PDF_DIST_DOCS := $(wildcard $(PDF_DIST_DIR)*/*.pdf)

# Powerpoint
PPTX_DIST_DIR = dist/pptx/
PPTX_DIST_DOCS := $(wildcard $(PPTX_DIST_DIR)*/*.pptx)

# All formats
EXPORTED_DOCS=\
	       $(SOURCE_DOCS:.md=.html) \
				 $(SOURCE_DOCS:.md=.pdf) \
				 $(SOURCE_DOCS:.md=.pptx) \

# pandoc has to be in ur $PATH
PANDOC=pandoc
PANDOC_OPTIONS=
PANDOC_PDF_OPTIONS=
PANDOC_PPTX_OPTIONS=
PANDOC_REVEALJS_OPTIONS=-t revealjs -s -V revealjs-url=https://revealjs.com

all : $(EXPORTED_DOCS)

%.html : %.md
	@export OUTPATH=$(REVEALJS_DIST_DIR)$$(echo $@|cut -d'/' -f3-) && $(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_REVEALJS_OPTIONS) -o $$OUTPATH $<

%.pdf : %.md
	@export OUTPATH=$(PDF_DIST_DIR)$$(echo $@|cut -d'/' -f3-) && $(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $$OUTPATH $<

%.pptx : %.md
	@export OUTPATH=$(PPTX_DIST_DIR)$$(echo $@|cut -d'/' -f3-) && $(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PPTX_OPTIONS) -o $$OUTPATH $<

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(REVEALJS_DIST_DOCS) $(PDF_DIST_DOCS)
