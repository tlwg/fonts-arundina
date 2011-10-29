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

TTFFILES = $(shell echo $(FONTSOURCES) | sed 's/.sfd/.ttf/g')
AFMFILES = $(shell echo $(FONTSOURCES) | sed 's/.sfd/.afm/g')
PFAFILES = $(shell echo $(FONTSOURCES) | sed 's/.sfd/.pfa/g')
PFBFILES = $(shell echo $(FONTSOURCES) | sed 's/.sfd/.pfb/g')

TYPE1FILES =
if INCLUDE_PFA
TYPE1FILES += $(PFAFILES) $(AFMFILES)
endif
if INCLUDE_PFB
TYPE1FILES += $(PFBFILES) $(AFMFILES)
endif

CLEANFILES = *.ttf *.g2n *.pfb *.pfa *.afm *.pfm *.otf *.enc *.tfm

EXTRA_DIST = $(FONTSOURCES)

if INCLUDE_TTF
ttf_DATA = $(TTFFILES)
endif

if INCLUDE_TYPE1
type1_DATA = $(TYPE1FILES)
endif

include $(top_builddir)/scripts/gen.mk

if INCLUDE_LATEX

arunserif.ttf:    ArundinaSerif.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunserif_b.ttf:  ArundinaSerif-Bold.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunsans.ttf:     ArundinaSans.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunsans_b.ttf:   ArundinaSans-Bold.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunsans_o.ttf:   ArundinaSans-Oblique.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunsans_bo.ttf:  ArundinaSans-BoldOblique.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunmono.ttf:     ArundinaSans.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunmono_b.ttf:   ArundinaSans-Bold.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunmono_o.ttf:   ArundinaSans-Oblique.ttf
	[ -f $@ ] || $(LN_S) $< $@
arunmono_bo.ttf:  ArundinaSans-BoldOblique.ttf
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
