SUBDIRS = examples

FD_FILES = \
	ltharunsans.fd \
	ltharunmono.fd \
	ltharunserif.fd

EXTRA_DIST = \
	texfont.mk.am \
	fonts-arundina.sty \
	ltharun.enc \
	thailigs.enc \
	thai-dummy.afm \
	$(FD_FILES)

if INCLUDE_LATEX

encdir = $(texmfdir)/fonts/enc/dvips/$(LATEX_PACKAGE)
enc_DATA = ltharun.enc

latexdir = $(texmfdir)/tex/latex/$(LATEX_PACKAGE)
latex_DATA = fonts-arundina.sty $(FD_FILES)

endif

