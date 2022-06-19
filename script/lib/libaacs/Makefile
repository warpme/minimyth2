
GARNAME      = libaacs
GARVERSION   = 0.11.1
CATEGORIES   = lib
MASTER_SITES = https://code.videolan.org/videolan/libaacs/-/archive/0.11.0/
#PATCHFILES   = fix-compilation.patch
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/libgcrypt
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-werror \
	--disable-extra-warnings \
	--disable-optimizations \
	--disable-debug \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE) 

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
