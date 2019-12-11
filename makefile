SRC_DIR = src/markdown/*
DIST_DIR = dist/

SOURCE_DOCS := $(wildcard $(SRC_DIR)/*.md)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.html) \
 # $(SOURCE_DOCS:.md=.pdf) \
 # $(SOURCE_DOCS:.md=.pptx) \

RM=/bin/rm

# pandoc has to be in ur $PATH
PANDOC=pandoc

PANDOC_OPTIONS=

PANDOC_REVEALJS_OPTIONS=-t revealjs -s -V revealjs-url=https://revealjs.com
PANDOC_PDF_OPTIONS=
PANDOC_PPTX_OPTIONS=

%.html : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_REVEALJS_OPTIONS) -o $@ $<

# %.pdf : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<
#
# %.pptx : %.md
# 	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@ $<

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
