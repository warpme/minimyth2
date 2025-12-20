
GARNAME       = alsa-lib
GARVERSION    = 1.2.15.1
CATEGORIES    = lib
MASTER_SITES  = ftp://ftp.alsa-project.org/pub/lib/
MASTER_SITES += ftp://ftp.alsa-project.org/pub/testing/
PATCHFILES    = $(DISTNAME)-add-simple-card.patch
PATCHFILES   += $(DISTNAME)-add-support-for-Amlogic-AIU-and-AXG-cards.patch
PATCHFILES   += $(DISTNAME)-alsa.conf-enable-namehint.patch
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

clean-all:
	@rm -rf $(DESTDIR)$(datadir)/{alsa/cards*,alsa/ctl*,alsa/pcm*,alsa/alsa.conf,aclocal/alsa*}
	@rm -rf $(DESTDIR)$(includedir)/alsa*
	@rm -rf $(DESTDIR)$(bindir)/aserver
	@rm -rf $(DESTDIR)$(libdir)/{libasound*,libatopology*,pkgconfig/alsa*}
