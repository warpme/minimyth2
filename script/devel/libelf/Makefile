GARNAME      = elfutils
GARVERSION   = 0.178
CATEGORIES   = devel
MASTER_SITES = https://fedorahosted.org/releases/e/l/$(GARNAME)/$(GARVERSION)/
PATCHFILES   = $(DISTNAME)-hack-to-fix-compile.patch
PATCHFILES  += $(DISTNAME)-turnoff-warings-as-errors.patch
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
	--disable-silent-rules \
	--disable-debuginfod \

include ../../gar.mk

CFLAGS   += -Wno-all
LDFLAGS  += -Wno-all

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
