
GARNAME      = amlogic-optee_armtz-firmware
# head at 6.11.2026
GARVERSION   = 7a0353c2874aaea9c60056c7036f67a36657d5e9
CATEGORIES   = firmware
MASTER_SITES = https://github.com/LibreELEC/meson-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/meson-firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/optee_armtz
	@cp -Rdf $(WORKSRC)/optee_armtz/s4/526fc4fc-7ee6-4a12-96e3-83da9565bce8.ta $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM1S
	@cp -Rdf $(WORKSRC)/optee_armtz/t7/526fc4fc-7ee6-4a12-96e3-83da9565bce8.ta $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM4
	@cp -Rdf $(WORKDIR)/../../files/* $(DESTDIR)$(elibdir)/firmware/optee_armtz/

	@mkdir -p $(DESTDIR)$(elibdir)/firmware/meson/vdec
	@cp -Rdf $(WORKSRC)/meson/vdec/s4/video_ucode.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/meson/vdec/t7/video_ucode.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/video_ucode.bin-t7
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM1S
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.KhadasVIM4
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.TanixW2TVBox
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.TV98TVBox
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.X96MaxPlusUltra
	@rm -rf $(DESTDIR)$(elibdir)/firmware/optee_armtz/VideoFW-TA.RBoxHK1
	@rm -rf $(DESTDIR)$(elibdir)/firmware/meson/vdec/video_ucode.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/meson/vdec/video_ucode.bin-t7
