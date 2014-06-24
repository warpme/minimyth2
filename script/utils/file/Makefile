GARNAME = file
GARVERSION = 5.12
CATEGORIES = utils
MASTER_SITES  = ftp://ftp.astron.com/pub/$(GARNAME)/
MASTER_SITES += ftp://ftp.gw.com/mirrors/pub/unix/$(GARNAME)/
DISTFILES = $(DISTNAME).tar.gz
LICENSE = BSD_2_Clause

DESCRIPTION = 
define BLURB
endef

DEPENDS    = lang/c lib/zlib
BUILDDEPS  =
ifneq ($(DESTIMG),build)
BUILDDEPS += utils/file
endif

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--enable-shared \
	--disable-static \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libmagic.la
	@$(MAKECOOKIE)
