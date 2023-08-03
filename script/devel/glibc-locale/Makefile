
GARNAME    = glibc-locale
GARVERSION = $(GLIBC_VERSION)
CATEGORIES = devel
SOURCEPKG  = devel/glibc
LICENSE    = GPL2/LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c
BUILDDEPS = devel/glibc-localedef-static

INSTALL_SCRIPTS = locale

GAR_EXTRA_CONF += devel/glibc/package-api.mk
include ../../gar.mk

install-locale:
	@rm -rf $(DESTDIR)$(libdir)/locale
	@mkdir -p $(DESTDIR)$(libdir)/locale
	@locale_input_list=`grep -r 'LC_CTYPE' $(DESTDIR)$(datadir)/i18n/locales/* | sed -e 's!:.*!!' -e 's!.*/!!' | sort -u`; \
	 for locale_input_file in $${locale_input_list} ; do \
		echo "creating $(DESTDIR)$(libdir)/locale/$${locale_input_file}.UTF-8" ; \
		I18NPATH=$(DESTDIR)$(datadir)/i18n \
		$(build_DESTDIR)/$(build_bindir)/glibc-localedef-static/localedef --force --quiet \
			-f $(DESTDIR)$(datadir)/i18n/charmaps/UTF-8 \
			-i $(DESTDIR)$(datadir)/i18n/locales/$${locale_input_file} \
			$(DESTDIR)$(libdir)/locale/$${locale_input_file}.UTF-8 ; \
	 done
