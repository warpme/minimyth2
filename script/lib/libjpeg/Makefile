GARNAME = jpeg
GARVERSION = 8d
CATEGORIES = lib
MASTER_SITES = http://www.ijg.org/files/
DISTFILES = jpegsrc.v$(GARVERSION).tar.gz
LICENSE = jpeg
jpeg_LICENSE_TEXT = $(WORKSRC)/README
DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-static \
	--enable-shared \
	--with-gnu-ld

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libjpeg.la
	@$(MAKECOOKIE)
