
GARNAME      = expect
GARVERSION   = 5.45.4
CATEGORIES   = utils
MASTER_SITES = https://downloads.sourceforge.net/project/expect/Expect/$(GARVERSION)/
DISTFILES    = expect$(GARVERSION).tar.gz
PATCHFILES   = timesys-allow-cross-compile.patch update-config.sub.patch
WORKSRC      = $(WORKDIR)/expect$(GARVERSION)
LICENSE      = GPL

DEPENDS = utils/tcl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = custom

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --prefix="$(prefix)" \
	--with-tcl="$(DESTDIR)$(libdir)" \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

install-custom:
	@mkdir -p $(DESTDIR)$(libdir)
	@cp $(WORKSRC)/libexpect5.45.4.so $(DESTDIR)$(libdir)/libexpect5.45.4.so
	@mkdir -p $(DESTDIR)$(bindir)
	@cp $(WORKSRC)/expect $(DESTDIR)$(bindir)/expect
	@$(MAKECOOKIE)
