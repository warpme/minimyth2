
GARNAME      = libbytesize
GARVERSION   = 2.7
CATEGORIES   = lib
MASTER_SITES = https://github.com/rhinstaller/libbytesize/archive/
DISTFILES    = $(GARVERSION).tar.gz
LICENSE      = LGPL2

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c devel/mpfr lib/pcre2

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-python3 \
	--without-gtk-doc \
	--without-tools \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libbytesize.la
	@$(MAKECOOKIE)
