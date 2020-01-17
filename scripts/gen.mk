SUFFIXES: .sfd .ttf .otf .afm .pfb

%.ttf: %.sfd
	$(FONTFORGE) -script $(top_srcdir)/scripts/gen-ttf.pe $<

%.otf: %.sfd
	$(PYTHON) $(top_srcdir)/scripts/gen-otf.py $<

%.afm %.pfb: %.sfd
	$(PYTHON) $(top_srcdir)/scripts/gen-pfb.py $<
