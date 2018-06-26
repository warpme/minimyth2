GARNAME = elfutils
GARVERSION = 0.169
CATEGORIES = devel
MASTER_SITES = https://fedorahosted.org/releases/e/l/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.bz2
LICENSE = LGPL3

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
	--enable-textrelcheck \
	--enable-symbol-versioning \
	--enable-nls

include ../../gar.mk

# elfutils 0.163 fails to compile with gcc 5.2.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))   -fno-lto
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS)) -fno-lto
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))  -fno-lto

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libelf.a
	@$(MAKECOOKIE)
