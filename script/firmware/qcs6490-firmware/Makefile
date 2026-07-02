
GARNAME      = radxa-firmware
# git@01.07.2026
GARVERSION   = 6a9efd21ebd78d4dd73939fd3b6a7ff3ef8801ca
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/radxa-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =

DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:

	@cp $(WORKSRC)/radxa-firmware-qcs6490/lib/firmware/qcom/qcs6490/a660_zap.mbn \
	    $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/a660_zap.mbn
	@cp $(WORKSRC)/radxa-firmware-qcs6490/lib/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn \
	    $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/a660_zap.mbn
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a/cdsp.mbn
