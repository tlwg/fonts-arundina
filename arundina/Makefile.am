FONTSOURCES = \
	ArundinaSans.sfd \
	ArundinaSans-Oblique.sfd \
	ArundinaSans-Bold.sfd \
	ArundinaSans-BoldOblique.sfd \
	ArundinaSansMono.sfd \
	ArundinaSansMono-Oblique.sfd \
	ArundinaSansMono-Bold.sfd \
	ArundinaSansMono-BoldOblique.sfd \
	ArundinaSerif.sfd \
	ArundinaSerif-Bold.sfd

TTFFILES = $(FONTSOURCES:.sfd=.ttf)
OTFFILES = $(FONTSOURCES:.sfd=.otf)
AFMFILES = $(FONTSOURCES:.sfd=.afm)
PFBFILES = $(FONTSOURCES:.sfd=.pfb)

CLEANFILES = *.ttf *.g2n *.pfb *.pfa *.afm *.pfm *.otf *.enc *.tfm

EXTRA_DIST = $(FONTSOURCES)

if INCLUDE_TTF
ttf_DATA = $(TTFFILES)
endif

if INCLUDE_OTF
otf_DATA = $(OTFFILES)
endif

if INCLUDE_PFB
type1_DATA = $(PFBFILES) $(AFMFILES)
endif

include $(top_srcdir)/scripts/gen.mk

if INCLUDE_LATEX

arunserif.pfb:    ArundinaSerif.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunserif_b.pfb:  ArundinaSerif-Bold.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunsans.pfb:     ArundinaSans.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunsans_b.pfb:   ArundinaSans-Bold.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunsans_o.pfb:   ArundinaSans-Oblique.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunsans_bo.pfb:  ArundinaSans-BoldOblique.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunmono.pfb:     ArundinaSansMono.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunmono_b.pfb:   ArundinaSansMono-Bold.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunmono_o.pfb:   ArundinaSansMono-Oblique.pfb
	[ -f $@ ] || $(LN_S) $< $@
arunmono_bo.pfb:  ArundinaSansMono-BoldOblique.pfb
	[ -f $@ ] || $(LN_S) $< $@

arunserif.afm:    ArundinaSerif.afm
	[ -f $@ ] || $(LN_S) $< $@
arunserif_b.afm:  ArundinaSerif-Bold.afm
	[ -f $@ ] || $(LN_S) $< $@
arunsans.afm:     ArundinaSans.afm
	[ -f $@ ] || $(LN_S) $< $@
arunsans_b.afm:   ArundinaSans-Bold.afm
	[ -f $@ ] || $(LN_S) $< $@
arunsans_o.afm:   ArundinaSans-Oblique.afm
	[ -f $@ ] || $(LN_S) $< $@
arunsans_bo.afm:  ArundinaSans-BoldOblique.afm
	[ -f $@ ] || $(LN_S) $< $@
arunmono.afm:     ArundinaSansMono.afm
	[ -f $@ ] || $(LN_S) $< $@
arunmono_b.afm:   ArundinaSansMono-Bold.afm
	[ -f $@ ] || $(LN_S) $< $@
arunmono_o.afm:   ArundinaSansMono-Oblique.afm
	[ -f $@ ] || $(LN_S) $< $@
arunmono_bo.afm:  ArundinaSansMono-BoldOblique.afm
	[ -f $@ ] || $(LN_S) $< $@

FONTS = \
	arunserif \
	arunserif_b \
	arunsans \
	arunsans_b \
	arunsans_o \
	arunsans_bo \
	arunmono \
	arunmono_b \
	arunmono_o \
	arunmono_bo

SYNTH_FONTS = \
	arunserif_so \
	arunserif_b_so

MAP = arundina.map

include $(top_srcdir)/latex/texfont.mk.am

endif # INCLUDE_LATEX
