
GARNAME       = alsa-lib
GARVERSION    = 1.2.13
CATEGORIES    = lib
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/lib/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
# amlogic patches https://github.com/chewitt/alsa-lib/commits/amlogic
PATCHFILES    = $(DISTNAME)-add-Amlogic-cards.patch
PATCHFILES   += $(DISTNAME)-add-simple-card.patch
DISTFILES     = $(DISTNAME).tar.bz2
LICENSE       = LGPL2_1

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-static \
	--enable-shared \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libasound.la
	@rm -f $(DESTDIR)$(libdir)/libatopology.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-sbase.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-ac97.la
	@rm -f $(DESTDIR)$(libdir)/alsa-lib/smixer/smixer-hda.la
	@$(MAKECOOKIE)
