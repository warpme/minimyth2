GARNAME = flac
GARVERSION = 1.3.1
CATEGORIES = lib
MASTER_SITES = http://downloads.xiph.org/releases/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.xz
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
	--disable-silent-rules \
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

# flac 1.3.1 fails to compile with gcc 5.2.0's link time optimization enabled.
CFLAGS   := $(filter-out -flto, $(CFLAGS))   -fno-lto
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS)) -fno-lto
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))  -fno-lto

pre-configure:
	@$(call FIX_LIBTOOL_LIBPATH,$(WORKSRC),configure)
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
ifeq ($(DESTIMG),main)
ifeq ($(GARCH_FAMILY),arm)
	@echo "Hack for building Wayland on ARM..."
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so $(DESTDIR)$(libdir)/libgcc_s.so
	@ln -sr $(DESTDIR)$(elibdir)/libgcc_s.so.1 $(DESTDIR)$(libdir)/libgcc_s.so.1
endif
endif
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libFLAC++.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC.la
	@rm -f $(DESTDIR)$(libdir)/libOggFLAC++.la
# I don't know why but libtool relinking on ARM needs this...
# xxxx - fixme
	@echo "Deleting hack for building Wayland on ARM..."
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so
	@rm -f $(DESTDIR)$(libdir)/libgcc_s.so.1
	@$(MAKECOOKIE)
