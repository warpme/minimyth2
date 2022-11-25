
GARNAME      = elfutils
GARVERSION   = 0.187
CATEGORIES   = devel
MASTER_SITES = https://fedorahosted.org/releases/e/l/$(GARNAME)/$(GARVERSION)/
PATCHFILES   = $(DISTNAME)-hack-to-fix-compile.patch
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = LGPL3

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c devel/zlib
BUILDDEPS = devel-tainted/devel-tainted devel/make devel/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/libelf/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/libelf/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--program-prefix="eu-" \
	--enable-silent-rules \
	--disable-debuginfod \
	--disable-libdebuginfod \

include ../../gar.mk

CFLAGS   += -Wno-all
LDFLAGS  += -Wno-all

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
