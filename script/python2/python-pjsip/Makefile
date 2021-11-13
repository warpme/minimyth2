
GARNAME      = pjproject
GARVERSION   = 2.10
CATEGORIES   = lib
MASTER_SITES = http://www.pjsip.org/release/$(GARVERSION)/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-fix-cross-compile.patch
LICENSE      = GPL2
define BLURB
endef

DEPENDS = python2/python lib/libpjsip

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

BUILD_ARGS     =
INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
	CONFIGURE_ENV  =
	BUILD_ENV      =
	INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

CONFIGURE_SCRIPTS = $(WORKSRC)/configure

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--enable-shared \
	--disable-opencore-amr \
	--disable-video \
	--disable-sdl \
	--disable-ffmpeg \
	--disable-v4l2 \
	--disable-libwebrtc \

ifneq ($(DESTIMG),build)
BUILD_ENV  += PYTHONXCPREFIX=$(DESTDIR)$(prefix)
endif

GAR_EXTRA_CONF += python2/python/package-api.mk
include ../../gar.mk

CFLAGS  := $(CFLAGS)  -fPIC
LDFLAGS := $(LDFLAGS) -fPIC

CFLAGS  += -I$(DESTDIR)$(PYTHON_includedir)
CFLAGS  += -L$(DESTDIR)$(libdir)
LDFLAGS += -I$(DESTDIR)$(PYTHON_includedir)
LDFLAGS += -L$(DESTDIR)$(libdir)
CPPLAGS += -L$(DESTDIR)$(libdir)

build-%/setup.py:
	@echo " ==> Running setup.py build in $(WORKSRC)/pjsip-apps/src/python"
	@cd $(WORKSRC)/pjsip-apps/src/python && $(BUILD_ENV) python2 setup.py build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $(WORKSRC)/pjsip-apps/src/python"
	@cd $(WORKSRC)/pjsip-apps/src/python && $(INSTALL_ENV) python2 setup.py install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
