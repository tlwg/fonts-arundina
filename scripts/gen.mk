SUFFIXES: .sfd .ttf .otf .afm .pfb

%.ttf: %.sfd
	$(FONTFORGE) -script $(top_srcdir)/scripts/gen-ttf.pe $<

%.otf: %.sfd
	$(PYTHON) $(top_srcdir)/scripts/gen-otf.py $<

%.afm %.pfb: %.sfd
	$(PYTHON) $(top_srcdir)/scripts/gen-pfb.py $<
	TMPFILE=$$(mktemp /tmp/tltx.XXXXXXXXX) && \
	  $(SED) \
	    -e '/^Comment Creation Date:/d' \
            $*.afm > $${TMPFILE} && \
	  mv -f $${TMPFILE} $*.afm
	TMPFILE=$$(mktemp /tmp/tltx.XXXXXXXXX) && \
	  $(SED) \
            -e '/^%%CreationDate:/d' \
            -e '/^%%Creator:/d' \
            $*.pfb > $${TMPFILE} && \
	  mv -f $${TMPFILE} $*.pfb
