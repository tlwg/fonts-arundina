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
