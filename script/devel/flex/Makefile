
GARNAME      = flex
GARVERSION   = 2.6.4
CATEGORIES   = lib
MASTER_SITES = https://github.com/westes/flex/releases/download/v2.6.4/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = $(DISTNAME)-perl.patch.gar $(DISTNAME)-pie.patch
LICENSE      = $(GARNAME)
$(GARNAME)_LICENSE_TEXT=$(WORKSRC)/COPYING

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-rpath \
	--with-gnu-ld \
	--cache-file=config.cache \

#	ac_cv_func_reallocarray=no

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libfl.la
	@ln -srf $(DESTDIR)$(bindir)/flex $(DESTDIR)$(bindir)/lex
	@$(MAKECOOKIE)

include ../../gar.mk
