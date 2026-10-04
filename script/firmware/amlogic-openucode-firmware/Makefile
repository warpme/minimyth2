
GARNAME      = amlogic-openucode-firmware
GARVERSION   = 18039cfa18da18465bcfec0609c95c9cd3f95c9b
CATEGORIES   = firmware
MASTER_SITES = https://github.com/gusbourg/openucode/archive/
DISTFILES    = $(GARVERSION).zip

LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC=$(WORKDIR)/openucode-$(GARVERSION)

DEPENDS = 

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/meson/vdec
	@cp -Rdf $(WORKSRC)/firmware/mpeg2/ompeg2_sl.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/firmware/h264/oh264_sl.bin   $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/firmware/mpeg4/ompeg4_sl.bin $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/firmware/vc1/ovc1_sl.bin     $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/firmware/hevc/ohevc_sl.bin   $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@cp -Rdf $(WORKSRC)/firmware/vp9/ovp9_sl.bin     $(DESTDIR)$(elibdir)/firmware/meson/vdec/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/meson/vdec/*_sl.bin
