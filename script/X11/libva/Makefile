
GARNAME = libva

ifeq (1,1)
# Official Intel repo
GARVERSION   = 2.8.0
CATEGORIES   = X11
MASTER_SITES = https://github.com/intel/libva/archive/
PATCHFILES   = 0001-Add-dec_ref_pic_marking-syntax-element-size-to-VASliceParameterBuff.patch
PATCHFILES  += 0002-Add-idr_pic_id-syntax-element-to-VASliceParameterBufferH264.patch
PATCHFILES  += 0003-Add-size-of-the-pic_order_cnt-related-syntax-elements-to-VASliceParam.patch
PATCHFILES  += 0004-Add-num_ref_idx_l01_default_active_minus1-syntax-elements-to-VAPicture.patch
DISTFILES    = $(GARVERSION).tar.gz
endif

ifeq (1,0)
# Phillip Zabel repo for Hantro
GARVERSION   = 0b8a288ea72aa644fddde4f76035c6d6d7192397
CATEGORIES   = X11
MASTER_SITES = https://github.com/pH5/libva/archive/
DISTFILES    = $(GARVERSION).zip
endif

LICENSE      = MIT

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx xorg/xorg

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-silent-rules \
	--disable-docs \
	--enable-drm \
	--enable-x11 \
	--enable-glx \
	--enable-egl \
	--enable-wayland \
	--disable-dummy-driver \
	--disable-static \
	--enable-shared \
	--with-drivers-path="$(libdir)/va" \
	--with-gnu-ld

include ../../gar.mk

pre-configure:
	@mkdir -p $(WORKSRC)/m4
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libva.la
	@rm -f $(DESTDIR)$(libdir)/libva-drm.la
	@rm -f $(DESTDIR)$(libdir)/libva-glx.la
	@rm -f $(DESTDIR)$(libdir)/libva-tpi.la
	@rm -f $(DESTDIR)$(libdir)/libva-x11.la
	@rm -f $(DESTDIR)$(libdir)/libva-wayland.la
	@$(MAKECOOKIE)
