
GARNAME      = radxa-firmware
# git@17.08.2026
GARVERSION   = dfbf7e0f6dde91fdd5f17315bce7dcf244422736
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

	@mkdir -p $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa/dragon-q8b
	@cp -rf $(WORKSRC)/radxa-firmware-sc8280xp/lib/firmware/qcom/sc8280xp/{*.mbn,radxa*} \
	        $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/qcom/vpu
	@cp -rf $(WORKSRC)/radxa-firmware-sc8280xp/lib/firmware/qcom/vpu/vpu20_p4_gen2_s6.mbn \
	        $(DESTDIR)$(elibdir)/firmware/qcom/vpu/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/{qccdsp8280.mbn,qcdxkmsuc8280.mbn,qcslpi8280.mbn,qcvss8280.mbn}
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/vpu/vpu20_p4_gen2_s6.mbn
