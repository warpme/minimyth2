
GARNAME      = nodejs
GARVERSION   = 20.2.0
CATEGORIES   = lib
MASTER_SITES = https://github.com/nodejs/node/archive/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
PATCHFILES   = ticket45756-fix-arm64-cross-compilation.patch
WORKSRC      = $(WORKDIR)/node-$(GARVERSION)
LICENSE      = MIT

DEPENDS = lib/openssl lib/icu

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile


ifeq ($(DESTIMG),build)
CONFIGURE_ENV = $(DIRPATHS)

CONFIGURE_ARGS = --prefix="$(prefix)" \
	--dest-os=linux \
	--without-npm \
	--shared-openssl \

else
CONFIGURE_ENV = $(DIRPATHS) CC=$(CC) CXX=$(CXX) CC_host=$(build_CC) CXX_host=$(build_CXX)

CONFIGURE_ARGS = --prefix="$(prefix)" \
	--dest-cpu=arm64 --cross-compiling --dest-os=linux \
	--with-intl=system-icu \
	--without-npm \
	--shared-openssl \
	--shared-zlib \

endif

configure-custom:
	$(CONFIGURE_ENV); cd $(WORKSRC) ; ./configure $(CONFIGURE_ARGS)

include ../../gar.mk

# disabling LTO as with LTO build fails
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))
