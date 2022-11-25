GARNAME = libjpeg-turbo
GARVERSION = 1.4.0
CATEGORIES = lib
MASTER_SITES = http://downloads.sourceforge.net/project/$(GARNAME)/$(GARVERSION)/
DISTFILES = $(DISTNAME).tar.gz
PATCHFILES = add_aarch64_detection.patch

LICENSE = jpeg
jpeg_LICENSE_TEXT = $(WORKSRC)/README
DESCRIPTION = 

define BLURB
endef

DEPENDS = lang/c devel/yasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libjpeg.la
	@rm -f $(DESTDIR)$(libdir)/libturbojpeg.la
	@$(MAKECOOKIE)
