
GARNAME      = ImageMagick
GARVERSION   = 6.9.12-19
CATEGORIES   = lib
MASTER_SITES = https://download.imagemagick.org/ImageMagick/download/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz

LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--without-perl

include ../../gar.mk

post-install:
	@mkdir -p $(DESTDIR)$(includedir)/magick
	@cp -rf $(WORKSRC)/magick/*.h $(DESTDIR)$(includedir)/magick/
	@rm -f $(DESTDIR)$(libdir)/libMagickWand*.la
	@rm -f $(DESTDIR)$(libdir)/libMagick++*.la
	@rm -f $(DESTDIR)$(libdir)/libpam_misc*.la
	@rm -f $(DESTDIR)$(libdir)/libMagickCore*.la
	@$(MAKECOOKIE)
