# Run "make" (or "make all") to convert to all other formats
# Run "make clean" to delete converted files
# Convert all files in this directory that have a .md suffix

SOURCE_DOCS := $(wildcard *.md)

EXPORTED_DOCS=\
 $(SOURCE_DOCS:.md=.revealjs) \
 $(SOURCE_DOCS:.md=.pdf) \
 $(SOURCE_DOCS:.md=.pptx) \

RM=/bin/rm

PANDOC=/usr/local/bin/pandoc

PANDOC_OPTIONS=--smart --standalone

PANDOC_REVEALJS_OPTIONS=
PANDOC_PDF_OPTIONS=
PANDOC_PPTX_OPTIONS=

%.revealjs : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_REVEALJS_OPTIONS) -o $@ $<

%.pdf : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_PDF_OPTIONS) -o $@ $<

%.pptx : %.md
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_DOCX_OPTIONS) -o $@ $<

# Targets and dependencies

.PHONY: all clean

all : $(EXPORTED_DOCS)

clean:
	- $(RM) $(EXPORTED_DOCS)
