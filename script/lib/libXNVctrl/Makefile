GARNAME = libXNVctrl
GARVERSION = $(mm_NVIDIA_VERSION)
CATEGORIES = lib
MASTER_SITES = https://github.com/NVIDIA/nvidia-settings/archive/
DISTFILES = $(GARVERSION).tar.gz
PATCHFILES = libxnvctrl_so.patch

LICENSE = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c

WORKSRC = $(WORKDIR)/nvidia-settings-$(GARVERSION)/

BUILD_SCRIPTS   = libXNVCtrl
INSTALL_SCRIPTS = libXNVCtrl

include ../../gar.mk

BUILD_ARGS   = \
	CC="$(CC)" \
	CPPFLAGS="$(CPPFLAGS)" \
	CFLAGS="$(CFLAGS) $(LDFLAGS)" \
	CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"

build-libXNVCtrl:
	@echo "Building..."
	$(MAKE) -C $(WORKSRC)/src/libXNVCtrl $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-libXNVCtrl:
	@mkdir -p $(DESTDIR)$(includedir)/NVCtrl
	@cp -rf $(WORKSRC)/src/libXNVCtrl/*.h $(DESTDIR)$(includedir)/NVCtrl
	@mkdir -p $(DESTDIR)$(libdir)
	@cp -rf $(WORKSRC)/src/libXNVCtrl/libXNVCtrl.so.0.0.0 $(DESTDIR)$(libdir)/libXNVCtrl.so.0.0.0
	@ln -sf $(DESTDIR)$(libdir)/libXNVCtrl.so.0.0.0 $(DESTDIR)$(libdir)/libXNVCtrl.so.0
	@ln -sf $(DESTDIR)$(libdir)/libXNVCtrl.so.0 $(DESTDIR)$(libdir)/libXNVCtrl.so
	@$(MAKECOOKIE)
