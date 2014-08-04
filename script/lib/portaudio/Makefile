GARNAME = portaudio
GARVERSION = svn-1919
CATEGORIES = lib
MASTER_SITES = http://www.portaudio.com/archives/pa_stable_v19_20140130.tgz
DISTFILES  = $(DISTNAME).tgz
LICENSE = $(GARNAME)
$(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LICENSE.txt

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)/$(GARNAME)

DEPENDS = lang/c lib/zlib

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static

include ../../gar.mk

post-install:
	@rm -f $(DESTDIR)$(libdir)/libportaudio.a
	@rm -f $(DESTDIR)$(libdir)/libportaudio.la
	@$(MAKECOOKIE)
