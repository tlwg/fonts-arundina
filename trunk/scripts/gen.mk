SUFFIXES: .sfd .ttf .afm .pfb

%.ttf: %.sfd
	$(FONTFORGE) -script $(top_srcdir)/scripts/gen-ttf.pe $<

%.afm %.pfb: %.sfd
	$(FONTFORGE) -script $(top_srcdir)/scripts/gen-pfb.pe $<
