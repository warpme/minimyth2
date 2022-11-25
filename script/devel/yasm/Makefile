GARNAME = yasm
GARVERSION = 1.3.0
CATEGORIES = devel
MASTER_SITES = http://www.tortall.net/projects/yasm/releases/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = Artistic/BSD_2_Clause/BSD_3_Clause/LGPL2/GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile
CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-debug \
	--disable-warnerror \
	--disable-profiling \
	--disable-gcov \
	--disable-python \
	--disable-python-bindings \
	--enable-nls \
	--disable-rpath \
	--without-dmalloc \
	--with-gnu-ld \
	--without-libiconv-prefix \
	--without-libintl-prefix

DEFAULT_ENV   = \
	CC_FOR_BUILD="$(build_CC) $(build_CFLAGS)" \
	CCLD_FOR_BUILD="$(build_CC) $(build_CFLAGS)"
CONFIGURE_ENV = $(DEFAULT_ENV)
BUILD_ENV     = $(DEFAULT_ENV)
INSTALL_ENV   = $(DEFAULT_ENV)

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libyasm.a
	@$(MAKECOOKIE)
