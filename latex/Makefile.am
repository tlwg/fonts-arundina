SUBDIRS = examples

FD_FILES = \
	ltharunsans.fd \
	ltharunmono.fd \
	ltharunserif.fd

EXTRA_DIST = \
	README.latex \
	texfont.mk.am \
	fonts-arundina.sty \
	ltharun.enc \
	thailigs.enc \
	thai-dummy.afm \
	$(FD_FILES)

if INCLUDE_LATEX

encdir = $(texmfdir)/fonts/enc/dvips/$(PACKAGE)
enc_DATA = ltharun.enc

latexdir = $(texmfdir)/tex/latex/$(PACKAGE)
latex_DATA = fonts-arundina.sty $(FD_FILES)

endif

