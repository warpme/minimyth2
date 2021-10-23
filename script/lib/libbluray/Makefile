
GARNAME      = libbluray
GARVERSION   = 1.3.0
CATEGORIES   = lib
MASTER_SITES = https://code.videolan.org/videolan/libbluray/-/archive/1.3.0/
DISTFILES    = $(DISTNAME).tar.bz2
LICENSE      = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lib/libxml2
BUILDDEPS =

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-werror \
	--disable-extra-warnings \
	--disable-optimizations \
	--disable-examples \
	--disable-bdjava-jar \
	--enable-shared \
	--enable-static \
	--disable-doxygen-doc \
	--disable-doxygen-dot \
	--disable-doxygen-man \
	--disable-doxygen-rtf \
	--disable-doxygen-xml \
	--disable-doxygen-chm \
	--disable-doxygen-chi \
	--disable-doxygen-html \
	--disable-doxygen-ps \
	--disable-doxygen-pdf \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(MAKE) -C ../libudfread patch
	@cp -rf ../libudfread/work/main.d/libudfread-1.1.2/* $(WORKSRC)/contrib/libudfread/
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).a
	@rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
	@$(MAKECOOKIE)
