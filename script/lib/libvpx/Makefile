GARNAME = libvpx
GARVERSION = 1.7.0
CATEGORIES = lib
MASTER_SITES = https://github.com/webmproject/libvpx/archive/
DISTFILES = v$(GARVERSION).tar.gz

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/yasm

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS =  \
	--enable-shared \
	--disable-static \
	--disable-examples \
	--disable-tools \
	--disable-docs \
	--disable-unit-tests \
	--as=yasm \
	$(if $(filter i386,  $(GARCH_FAMILY)),--target=x86-linux-gcc   ) \
	$(if $(filter x86_64,$(GARCH_FAMILY)),--target=x86_64-linux-gcc) \
	$(if $(filter arm,   $(GARCH_FAMILY)),--target=armv7-linux-gcc ) \
	$(if $(filter arm64, $(GARCH_FAMILY)),--target=armv8-linux-gcc ) \

include ../../gar.mk
