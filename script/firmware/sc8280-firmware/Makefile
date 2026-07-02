
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

	@mkdir -p $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp
	@cp -rf $(WORKSRC)/radxa-firmware-sc8280xp/lib/firmware/qcom/* \
	        $(DESTDIR)$(elibdir)/firmware/qcom/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin \
	         $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/{qccdsp8280.mbn,qcdxkmsuc8280.mbn,qcslpi8280.mbn,qcvss8280.mbn,SC8280XP-Radxa-Dragon-Q8B-tplg.bin}
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/vpu/vpu20_p4_gen2_s6.mbn
