
GARNAME      = flac
GARVERSION   = 1.3.3
CATEGORIES   = lib
MASTER_SITES = http://downloads.xiph.org/releases/$(GARNAME)/
DISTFILES    = $(DISTNAME).tar.xz
xiph_LICENSE_TEXT = $(WORKSRC)/COPYING.Xiph

DESCRIPTION =
define BLURB
endef

DEPENDS   = lang/c lang/cxx lib/libogg
BUILDDEPS = devel/nasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--enable-shared \
	--disable-static \
	--disable-altivec \
	--disable-doxygen-docs \
	--disable-xmms-plugin \
	--disable-oggtest \
	--disable-rpath \
	--with-gnu-ld \
	--with-ogg-includes=$(DESTDIR)$(includedir) \
	--with-ogg-libraries=$(DESTDIR)$(libdir)

include ../../gar.mk

pre-configure:
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libFLAC++.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC++.la
	@$(MAKECOOKIE)
