
GARNAME      = icu
GARVERSION   = 4c-76_1
CATEGORIES   = lib
MASTER_SITES = https://github.com/unicode-org/icu/releases/download/release-76-1/
DISTFILES    = $(GARNAME)$(GARVERSION)-src.tgz
LICENSE      = GPL2
WORKSRC      = $(WORKDIR)/icu/source

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

ifneq ($(DESTIMG),build)
BUILDDEPS += lib/icu
endif

CONFIGURE_ARGS = $(DIRPATHS) \
        --build=$(GARBUILD) \
        --host=$(GARHOST) \
        --disable-tests \
        --disable-samples

ifeq ($(DESTIMG),build)
MAKE_ARGS = Linux
CONFIGURE_ARGS += \
        --prefix="$(DESTDIR)" \
        ac_cv_c_bigendian=no
else
CONFIGURE_ARGS += \
        --prefix="$(DESTDIR)" \
        --with-cross-build="$(CURDIR)/work/build.d/icu/source/" \
        ac_cv_c_bigendian=no
endif

include ../../gar.mk
