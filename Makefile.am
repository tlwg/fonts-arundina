SUBDIRS = scripts latex arundina fontconfig

EXTRA_DIST =	\
	build-aux/git-version-gen	\
	$(NULL)

dist-hook:
	echo $(VERSION) > $(distdir)/VERSION

if INCLUDE_LATEX
tdsdist_tgz = $(LATEX_PACKAGE)-$(VERSION).tds.tar.gz
ctandist_tgz = $(LATEX_PACKAGE)-$(VERSION).ctan.tar.gz

tdsdist_zip = $(LATEX_PACKAGE)-$(VERSION).tds.zip
ctandist_zip = $(LATEX_PACKAGE)-$(VERSION).ctan.zip

tdsdistdir = $(LATEX_PACKAGE)-$(VERSION)-tds
ctandistdir = $(LATEX_PACKAGE)-$(VERSION)

inst-tds:
	rm -rf $(tdsdistdir)
	mkdir $(tdsdistdir)
	confdir=`cd $(top_srcdir) && pwd` \
	  && cd $(tdsdistdir) \
	  && $$confdir/configure --disable-ttf --enable-latex --prefix=/usr \
	       --with-texmfdir=/ --docdir=/doc/fonts/$(LATEX_PACKAGE) \
	  && $(MAKE) $(AM_MAKEFLAGS) \
	  && $(MAKE) $(AM_MAKEFLAGS) DESTDIR=`pwd`/inst install \
	  && rm -rf inst/usr \
	  && mkdir -p inst/source/fonts/$(LATEX_PACKAGE) \
	  && make distdir distdir=inst/source/fonts/$(LATEX_PACKAGE)

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
	rm -rf $(ctandistdir)
	cp -a $(distdir) $(ctandistdir)
	tar cf - $(tdsdist_tgz) $(ctandistdir) | gzip -9 -c > $(ctandist_tgz)
	rm -rf $(ctandistdir)
	$(am__remove_distdir)

dist-ctan-zip: dist-tds-zip distdir
	rm -f $(ctandist_zip)
	rm -rf $(ctandistdir)
	cp -a $(distdir) $(ctandistdir)
	zip -r $(ctandist_zip) $(tdsdist_zip) $(ctandistdir)
	rm -rf $(ctandistdir)
	$(am__remove_distdir)

dist-ctan: dist-ctan-zip

.PHONY: dist-ctan dist-ctan-tgz dist-ctan-zip dist-tds dist-tds-tgz dist-tds-zip inst-tds
endif # INCLUDE_LATEX

