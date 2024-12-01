
GARNAME      = makemkv-oss
GARVERSION   = $(MAKEMKV_VERSION)
CATEGORIES   = utils
MASTER_SITES = $(MAKEMKV_MASTER_SITES)
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.gz
LICENSE      = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ffmpeg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --prefix="$(prefix)" \
        --sysconfdir="$(sysconfdir)" \
        --libexecdir="$(libexecdir)" \
        --disable-gui \
        --disable-allcodecs \

GAR_EXTRA_CONF += utils/makemkv-bin/package-api.mk
include ../../gar.mk

CFLAGS   += -D__STDC_FORMAT_MACROS
CFLAGS   += -D__GNU_SOURCE
CFLAGS   += -D__STDC_CONSTANT_MACROS
CFLAGS   += -D__STDC_LIMIT_MACROS

post-install:
	@rm -rf $(DESTDIR)$(libdir)/libaacs.so*
	@rm -rf $(DESTDIR)$(libdir)/libbdplus.so*
	@ln -s $(DESTDIR)$(libdir)/libmmbd.so.0 $(DESTDIR)$(libdir)/libaacs.so.0
	@ln -s $(DESTDIR)$(libdir)/libmmbd.so.0 $(DESTDIR)$(libdir)/libbdplus.so.0
	@$(MAKECOOKIE)
