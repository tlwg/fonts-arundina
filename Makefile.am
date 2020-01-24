SUBDIRS = scripts latex arundina fontconfig

EXTRA_DIST =	\
	build-aux/git-version-gen	\
	$(NULL)

dist-hook:
	echo $(VERSION) > $(distdir)/VERSION

if INCLUDE_LATEX
tdsdist_tgz = $(PACKAGE)-$(VERSION).tds.tar.gz
ctandist_tgz = $(PACKAGE)-$(VERSION).ctan.tar.gz

tdsdist_zip = $(PACKAGE)-$(VERSION).tds.zip
ctandist_zip = $(PACKAGE)-$(VERSION).ctan.zip

tdsdistdir = $(PACKAGE)-$(VERSION)-tds

inst-tds:
	rm -rf $(tdsdistdir)
	mkdir $(tdsdistdir)
	confdir=`cd $(top_srcdir) && pwd` \
	  && cd $(tdsdistdir) \
	  && $$confdir/configure --disable-ttf --enable-latex --prefix=/usr \
	       --with-texmfdir=/ --docdir=/doc/fonts/$(PACKAGE) \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) DESTDIR=`pwd`/inst install \
	  && rm -rf inst/usr \
	  && mkdir -p inst/source/fonts/$(PACKAGE) \
	  && $(MAKE) distdir distdir=inst/source/fonts/$(PACKAGE)

dist-tds-tgz: inst-tds
	rm -f $(tdsdist_tgz)
	cd $(tdsdistdir)/inst \
	  && tar cf - * | gzip -9 -c > ../../$(tdsdist_tgz)
	rm -rf $(tdsdistdir)

dist-tds-zip: inst-tds
	rm -f $(tdsdist_zip)
	cd $(tdsdistdir)/inst \
	  && zip -r ../../$(tdsdist_zip) *
	rm -rf $(tdsdistdir)

dist-tds: dist-tds-zip

dist-ctan-tgz: dist-tds-tgz distdir
	rm -f $(ctandist_tgz)
	tar cf - $(tdsdist_tgz) $(distdir) | gzip -9 -c > $(ctandist_tgz)
	$(am__remove_distdir)

dist-ctan-zip: dist-tds-zip distdir
	rm -f $(ctandist_zip)
	zip -r $(ctandist_zip) $(tdsdist_zip) $(distdir)
	$(am__remove_distdir)

dist-ctan: dist-ctan-zip

endif # INCLUDE_LATEX

.PHONY: dist-tds dist-tds-tgz dist-tds-zip inst-tds
.PHONY: dist-ctan dist-ctan-tgz dist-ctan-zip

#
# Font Binary Tarballs
#

otf_package = otf-arundina
ttf_package = ttf-arundina

otfdist_txz = $(otf_package)-$(VERSION).tar.xz
ttfdist_txz = $(ttf_package)-$(VERSION).tar.xz

otfdist_zip = $(otf_package)-$(VERSION).zip
ttfdist_zip = $(ttf_package)-$(VERSION).zip

otfdistdir = $(otf_package)-$(VERSION)
ttfdistdir = $(ttf_package)-$(VERSION)

fcdistdir = fontconfig-$(VERSION)

workingdir = work

inst-fonts.stamp:
	rm -rf $(otfdistdir) $(ttfdistdir)
	rm -rf $(fcdistdir)
	rm -rf $(workingdir)
	mkdir $(workingdir)
	confdir=`cd $(top_srcdir) && pwd` \
	  abs_otfdistdir=`pwd`/$(otfdistdir) \
	  abs_ttfdistdir=`pwd`/$(ttfdistdir) \
	  abs_fcdistdir=`pwd`/$(fcdistdir) \
	  && cd $(workingdir) \
	  && $$confdir/configure \
	       --enable-otf --with-otfdir=$$abs_otfdistdir \
	       --enable-ttf --with-ttfdir=$$abs_ttfdistdir \
	       --datadir=$$abs_fcdistdir \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) install
	cp -a $(fcdistdir)/* $(otfdistdir)
	cp -a $(fcdistdir)/* $(ttfdistdir)
	rm -rf $(fcdistdir)
	rm -rf $(workingdir)
	touch $@

dist-otf-txz: inst-fonts.stamp
	rm -f $(otfdist_txz)
	tar cJf $(otfdist_txz) $(otfdistdir)
	md5sum $(otfdist_txz) > $(otfdist_txz).md5sum

dist-otf-zip: inst-fonts.stamp
	rm -f $(otfdist_zip)
	zip -r $(otfdist_zip) $(otfdistdir)
	md5sum $(otfdist_zip) > $(otfdist_zip).md5sum

dist-ttf-txz: inst-fonts.stamp
	rm -f $(ttfdist_txz)
	tar cJf $(ttfdist_txz) $(ttfdistdir)
	md5sum $(ttfdist_txz) > $(ttfdist_txz).md5sum

dist-ttf-zip: inst-fonts.stamp
	rm -f $(ttfdist_zip)
	zip -r $(ttfdist_zip) $(ttfdistdir)
	md5sum $(ttfdist_zip) > $(ttfdist_zip).md5sum

dist-fonts-clean:
	rm -rf $(otfdistdir) $(ttfdistdir)
	rm -f inst-fonts.stamp

dist-fonts-txz: dist-otf-txz dist-ttf-txz

dist-fonts-zip: dist-otf-zip dist-ttf-zip

dist-fonts: dist-fonts-txz dist-fonts-zip dist-fonts-clean

.PHONY: dist-fonts-txz dist-otf-txz dist-ttf-txz
.PHONY: dist-fonts-zip dist-otf-zip dist-ttf-zip
.PHONY: dist-fonts dist-fonts-clean

