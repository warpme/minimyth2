
GARNAME      = pjproject
GARVERSION   = 2.11.1
PYTHONMODVER = d6bce7f2089d920ed02023872f35e62585a3d0d9
CATEGORIES   = lib
MASTER_SITES = https://github.com/pjsip/pjproject/archive/ https://github.com/mgwilliams/python3-pjsip/archive/
DISTFILES    = $(GARVERSION).tar.gz $(PYTHONMODVER).zip
PATCHFILES   = $(DISTNAME)-fix-cross-compile.patch
LICENSE      = GPL2
DESCRIPTION  = 
define BLURB
endef

DEPENDS   = lang/c lib/portaudio
BUILDDEPS = python3/python python3/python-setuptools python3/python-crossenv

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile python_bindings
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile python_bindings

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--prefix=/usr \
	--enable-shared \
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

pre-configure:
	@#$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@cp -rf $(WORKDIR)/python3-pjsip-$(PYTHONMODVER)/ $(WORKSRC)/pjsip-apps/src/python3
	@$(MAKECOOKIE)

build-python_bindings:
	@echo " ==> Running setup.py build in $(WORKSRC)/pjsip-apps/src/python3"
	@cd $(WORKSRC)/pjsip-apps/src/python3 && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(PYTHON3_CONFIGURE_ARGS) build $(PYTHON3_BUILD_ARGS)
	@$(MAKECOOKIE)

install-python_bindings:
	@echo " ==> Running setup.py install in $(WORKSRC)/pjsip-apps/src/python3"
	@cd $(WORKSRC)/pjsip-apps/src/python3 && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(PYTHON3_CONFIGURE_ARGS) install --skip-build $(PYTHON3_INSTALL_ARGS)
	@$(MAKECOOKIE)
