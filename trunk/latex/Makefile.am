SUBDIRS = examples

FD_FILES = \
	ltharunsans.fd \
	ltharunmono.fd \
	ltharunserif.fd

EXTRA_DIST = \
	texfont.mk.am \
	fonts-arundina.sty \
	$(FD_FILES)

if INCLUDE_LATEX

latexdir = $(texmfdir)/tex/latex/$(LATEX_PACKAGE)
latex_DATA = fonts-arundina.sty $(FD_FILES)

endif

