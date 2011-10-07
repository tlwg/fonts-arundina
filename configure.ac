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

AC_ARG_ENABLE(pfa,
              [AC_HELP_STRING([--enable-pfa],
                              [enable Type1 PFA generation])],
              , enable_pfa="no")
AC_ARG_ENABLE(pfb,
              [AC_HELP_STRING([--enable-pfb],
                              [enable Type1 PFB generation])],
              , enable_pfb="no")
if test "x$enable_pfa" = "xyes" -o "x$enable_pfb" = "xyes"; then
  AC_ARG_WITH(type1dir,
    [AC_HELP_STRING([--with-type1dir=DIR],
                    [font directory in DIR [PREFIX/share/fonts/type1/t1-thai-arundina]])],
    [type1dir="$withval"], [type1dir=\$\{prefix\}/share/fonts/type1/t1-thai-arundina])
  AC_MSG_CHECKING(--with-type1dir)
  AC_MSG_RESULT("$type1dir")

  AC_SUBST(type1dir)
fi

AM_CONDITIONAL(INCLUDE_TTF,test $enable_ttf = "yes")
AM_CONDITIONAL(INCLUDE_PFA,test $enable_pfa = "yes")
AM_CONDITIONAL(INCLUDE_PFB,test $enable_pfb = "yes")
AM_CONDITIONAL(INCLUDE_TYPE1,test $enable_pfa = "yes" -o $enable_pfb = "yes")

# Checks for programs.
AC_PROG_INSTALL
AC_PROG_LN_S
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


AC_CONFIG_FILES([Makefile
                 arundina/Makefile
                 scripts/Makefile
                 scripts/gen.mk])

AC_OUTPUT
