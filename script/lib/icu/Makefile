GARNAME = icu
GARVERSION = 4c-54_1
CATEGORIES = lib
MASTER_SITES = http://download.icu-project.org/files/icu4c/54.1/
DISTFILES = $(GARNAME)$(GARVERSION)-src.tgz
LICENSE = GPL2
WORKSRC = $(WORKDIR)/icu/source

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
        --prefix="$(DESTDIR)"
else
CONFIGURE_ARGS += \
        --prefix="$(DESTDIR)" \
        --with-cross-build="$(CURDIR)/work/build.d/icu/source/"
endif

include ../../gar.mk

CFLAGS   := $(filter-out -flto -fuse-linker-plugin, $(CFLAGS))
CXXFLAGS := $(filter-out -flto -fuse-linker-plugin, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto -fuse-linker-plugin, $(LDFLAGS))
