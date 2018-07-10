GARNAME = VisualBoyAdvance
GARVERSION = 1.7.2
CATEGORIES = emulators
MASTER_SITES = http://downloads.sourceforge.net/project/vba/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(GARNAME)-src-$(GARVERSION).tar.gz
PATCHFILES = \
	$(DISTNAME)-strrchr.patch \
	$(DISTNAME)-debugger.patch
LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libpng lib/SDL devel/zlib xorg/xorg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--x-includes="$(DESTDIR)$(includedir)" \
	--x-libraries="$(DESTDIR)$(libdir)" \
	$(if $(filter i386,$(GARCH_FAMILY)),--disable-c-core,--enable-c-core) \
	--disable-profiling \
	--enable-sdl \
	--disable-gtk \
	--disable-dev \
	--disable-sdltest \
	--disable-rpath \
	$(if $(filter i386,$(GARCH_FAMILY)),--with-mmx,--without-mmx) \
	--with-x \
	--with-gnu-ld \
	--disable-silent-rules \
	CFLAGS=-Wno-all \
	CPPFLAGS=-Wno-all \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)
