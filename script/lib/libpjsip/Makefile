
GARNAME      = pjproject
GARVERSION   = 2.11.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/pjsip/pjproject/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = \
	$(DISTNAME)-fix-cross-compile.patch \
	$(DISTNAME)-dont-build-java-bindings.patch \
	$(DISTNAME)-fix-installation-libpjsua2-libs.patch
LICENSE      = GPL2
DESCRIPTION  = 
define BLURB
endef

DEPENDS   = lang/c lib/portaudio
BUILDDEPS = python3/python python3/python-setuptools devel/swig

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile python_bindings
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile python_bindings

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--enable-shared \
	--disable-static \
	--disable-opencore-amr \
	--disable-video \
	--disable-sdl \
	--disable-ffmpeg \
	--disable-v4l2 \
	--disable-libwebrtc \
	--enable-resample-dll \
	--with-external-pa \
	--with-gnu-ld

PYTHON3_CONFIGURE_ARGS =
PYTHON3_BUILD_ARGS     =
PYTHON3_INSTALL_ARGS   = \
	--prefix=$(DESTDIR)$(prefix)
PYTHON3_CONFIGURE_ENV  =
PYTHON3_BUILD_ENV      =
PYTHON3_INSTALL_ENV    = \
	PYTHONPATH=$(DESTDIR)$(PYTHON_libdir)/site-packages

GAR_EXTRA_CONF += python3/python/package-api.mk
include ../../gar.mk

# Turn-off LTO & use -Os to save size
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -Os
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -Os
LDFLAGS  := $(filter-out -O%, $(LDFLAGS)) -Os

build-python_bindings:
	@$(MAKE) -C $(WORKSRC)/pjsip-apps/src/swig
	@cd $(WORKSRC)/pjsip-apps/src/swig/python && python3 setup.py $(PYTHON3_CONFIGURE_ARGS) build $(PYTHON3_BUILD_ARGS)
	@$(MAKECOOKIE)

install-python_bindings:
	@cd $(WORKSRC)/pjsip-apps/src/swig/python && python3 setup.py $(PYTHON3_CONFIGURE_ARGS) install --skip-build $(PYTHON3_INSTALL_ARGS)
	@$(MAKECOOKIE)

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/libpj*
	@rm -rf $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/site-packages/pjsua2*
	@rm -rf $(DESTDIR)$(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)//site-packages/_pjsua2*
