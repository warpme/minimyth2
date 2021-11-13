
GARNAME      = pjproject
GARVERSION   = 2.11.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/pjsip/pjproject/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = $(DISTNAME)-fix-cross-compile.patch
LICENSE      = GPL2
DESCRIPTION  = 
define BLURB
endef

DEPENDS   = lang/c lib/portaudio

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile swig pyhon_bindigs
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

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

include ../../gar.mk
GAR_EXTRA_CONF += python3/python/package-api.mk

pre-configure:
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

build-swig:
	@$(MAKE) -C $(WORKSRC)/pjsip-apps/src/swig

build-pyhon_bindigs:
	@cd $(WORKSRC)/pjsip-apps/src/swig/python && $(BUILD_ENV) python3 setup.py build $(BUILD_ARGS)
	@cd $(WORKSRC)/pjsip-apps/src/swig/python && $(INSTALL_ENV) python3 setup.py install --skip-build $(INSTALL_ARGS)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libpj*.a
	@cp $(WORKSRC)/pjsip-apps/bin/samples/*-linux-gnu/auddemo $(DESTDIR)$(bindir)/auddemo
	@$(MAKECOOKIE)
