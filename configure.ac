#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ(2.61)
AC_INIT(thaifonts-arundina, 0.1.2svn, thep@linux.thai.net)
AM_INIT_AUTOMAKE

FONTFORGE_MIN_VER=20080110

# Check options
AC_ARG_ENABLE(ttf,
              [AC_HELP_STRING([--disable-ttf],
                              [disable TTF generation])],
              , enable_ttf="yes")
if test "x$enable_ttf" = "xyes"; then
  AC_ARG_WITH(ttfdir,
    [AC_HELP_STRING([--with-ttfdir=DIR],
                    [font directory in DIR [PREFIX/share/fonts/truetype/ttf-thai-arundina]])],
    [ttfdir="$withval"], [ttfdir=\$\{prefix\}/share/fonts/truetype/ttf-thai-arundina])
  AC_MSG_CHECKING(--with-ttfdir)
  AC_MSG_RESULT("$ttfdir")

  AC_SUBST(ttfdir)
fi

AC_ARG_ENABLE(pfb,
              [AC_HELP_STRING([--enable-pfb],
                              [enable Type1 PFB generation])],
              , enable_pfb="no")
if test "x$enable_pfb" = "xyes"; then
  AC_ARG_WITH(type1dir,
    [AC_HELP_STRING([--with-type1dir=DIR],
                    [font directory in DIR [PREFIX/share/fonts/type1/t1-thai-arundina]])],
    [type1dir="$withval"], [type1dir=\$\{prefix\}/share/fonts/type1/t1-thai-arundina])
  AC_MSG_CHECKING(--with-type1dir)
  AC_MSG_RESULT("$type1dir")

  AC_SUBST(type1dir)
fi

AC_ARG_ENABLE(latex,
              [AC_HELP_STRING([--enable-latex],
                              [enable LaTeX fonts generation])],
              , enable_latex="no")

AM_CONDITIONAL(INCLUDE_TTF,test $enable_ttf = "yes")
AM_CONDITIONAL(INCLUDE_PFB,test $enable_pfb = "yes")
AM_CONDITIONAL(INCLUDE_LATEX,test $enable_latex = "yes")

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_LN_S
AC_PROG_SED
AC_CHECK_PROGS(RMDIR,rmdir,no)

AC_CHECK_PROGS(FONTFORGE,fontforge,no)

if test "x$FONTFORGE" = "xno"; then
  AC_MSG_ERROR([You need fontforge to generate fonts.])
else
  AC_MSG_CHECKING([for Fontforge >= $FONTFORGE_MIN_VER])
  FONTFORGE_VER=`$FONTFORGE --version 2>/dev/null | grep '^fontforge' | cut -d' ' -f2`
  if test $FONTFORGE_VER -lt $FONTFORGE_MIN_VER; then
    AC_MSG_ERROR([Requires Fontforge >= $FONTFORGE_MIN_VER but $FONTFORGE_VER was found)])
  fi
  AC_MSG_RESULT([$FONTFORGE_VER found, ok])
fi

if test "x$enable_latex" = "xyes"; then
  AC_CHECK_PROGS(AFM2TFM,afm2tfm,no)
  if test "x$AFM2TFM" = "xno" ; then
    AC_MSG_ERROR([You need afm2tfm (from texlive distribution)])
  fi
  AC_CHECK_PROGS(TTF2AFM,ttf2afm,no)
  if test "x$TTF2AFM" = "xno" ; then
    AC_MSG_ERROR([You need ttf2afm (from texlive distribution)])
  fi
  AC_CHECK_PROGS(TTF2TFM,ttf2tfm,no)
  if test "x$TTF2TFM" = "xno" ; then
    AC_MSG_ERROR([You need ttf2tfm (from texlive distribution)])
  fi
  AC_CHECK_PROGS(VPTOVF,vptovf,no)
  if test "x$VPTOVF" = "xno" ; then
    AC_MSG_ERROR([You need vptovf (from texlive distribution)])
  fi
  AC_CHECK_PROGS(KPSEWHICH,kpsewhich,no)
  if test "x$KPSEWHICH" = "xno" ; then
    AC_MSG_ERROR([You need kpsewhich (from texlive distribution)])
  fi

  dnl Check for thailatex resource
  file=$($KPSEWHICH thai-dummy.afm)
  if test "x$file" = "x"; then
    AC_MSG_ERROR([Cannot find "thai-dummy.afm". You need thailatex 0.4.6 or higher.])
  fi
  file=$($KPSEWHICH thailigs.enc)
  if test "x$file" = "x"; then
    AC_MSG_ERROR([Cannot find "thailigs.enc". You need thailatex 0.4.6 or higher.])
  fi

  AC_ARG_WITH(texmfdir,
    [AC_HELP_STRING([--with-texmfdir=DIR],
                    [texmf directory in DIR [PREFIX/share/texmf]])],
    [texmfdir="$withval"], [texmfdir=${datarootdir}/texmf])
  AC_MSG_CHECKING(--with-texmfdir)
  AC_MSG_RESULT("$texmfdir")                                                                                                           
  AC_SUBST(texmfdir)

  AC_PATH_PROGS(UPDMAP,[updmap-sys updmap],no)
  if test "x$UPDMAP" = "xno" ; then
    AC_MSG_ERROR([You need updmap-sys or updmap (from texlive distribution)])
  fi

  AC_PATH_PROG(TEXHASH,[mktexlsr texhash],no)
  if test "x$TEXHASH" = "xno" ; then
    AC_MSG_ERROR([You need mktexlsr or texhash (from texlive distribution)])
  fi
fi


AC_CONFIG_FILES([Makefile
                 arundina/Makefile
                 latex/Makefile
                 latex/examples/Makefile
                 scripts/Makefile
                 scripts/gen.mk])

AC_OUTPUT
