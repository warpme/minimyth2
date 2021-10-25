
GARNAME      = sqlite
GARVERSION   = 3360000
CATEGORIES   = db
MASTER_SITES = https://www.sqlite.org/2021/
DISTFILES    = sqlite-src-$(GARVERSION).zip
WORKSRC      = $(WORKDIR)/sqlite-src-$(GARVERSION)
LICENSE      =

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/readline lib/ncurses
BUILDDEPS = utils/tcl

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--enable-readline \
	--enable-threadsafe \
	--enable-dynamic-extensions \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libsqlite3.la
	@$(MAKECOOKIE)
