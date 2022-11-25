
GARNAME      = libva-v4l2-request
GARVERSION   = a3c2476de19e6635458273ceeaeceff124fabd63
MASTER_SITES = https://github.com/bootlin/libva-v4l2-request/archive/
DISTFILES    = $(GARVERSION).zip
PATCHFILES   = 0001-v4l2-introduce-v4l2_set_controls.patch
PATCHFILES  += 0002-v4l2-introduce-v4l2_get_controls.patch
PATCHFILES  += 0003-h264-update-to-merged-h.264-kernel-interface.patch
PATCHFILES  += 0004-h264-use-v4l2_set_controls-to-reduce-number-of-issue.patch
PATCHFILES  += 0005-h264-use-v4l2_get_controls-to-query-decode-mode-and-.patch
PATCHFILES  += 0006-h264-add-H.264-Annex-B-start-codes-if-required.patch
PATCHFILES  += 0007-h264-set-pic_num-in-dpb.patch
PATCHFILES  += 0008-h264-set-frame_num-in-slice_params.patch
PATCHFILES  += 0009-h264-extract-nal_ref_idc-and-nal_unit_type.patch
PATCHFILES  += 0010-h264-set-max_num_ref_frames-in-SPS.patch
PATCHFILES  += 0011-h264-set-profile_idc-in-SPS.patch
PATCHFILES  += 0012-Update-backend-for-kernel-5.14-POC.patch
PATCHFILES  += 0013-Don-t-advertise-broken-profiles.patch
WORKSRC      = $(WORKDIR)/libva-v4l2-request-$(GARVERSION)

LICENSE = GPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c X11/libva xorg/xorg X11/libva

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--disable-static \
	--enable-shared \
	--enable-silent-rules \

include ../../gar.mk

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(MAKECOOKIE)

post-install:
	@rm -rf $(DESTDIR)$(libdir)/dri/v4l2_request_drv_video.la
	@mkdir -p $(DESTDIR)$(libdir)
	@mv $(DESTDIR)$(libdir)/dri/v4l2_request_drv_video.so $(DESTDIR)$(libdir)/v4l2_request_drv_video.so

clean-all:
	@rm -rf $(DESTDIR)$(libdir)/v4l2_request_drv_video.so
