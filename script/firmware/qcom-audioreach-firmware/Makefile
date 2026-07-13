
GARNAME      = radxa-audioreach-topology-firmware
# rel 1.06.2026
GARVERSION   = 1.0.4-2
CATEGORIES   = firmware
MASTER_SITES = https://github.com/radxa-pkg/audioreach-topology/releases/download/$(GARVERSION)/
DISTFILES    = firmware-qcom-audioreach_1.0.4-2_all.deb
LICENSE      =
WORKSRC      = $(WORKDIR)/radxa-audioreach-topology-firmware-$(GARVERSION)
DESCRIPTION =
define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a
	@cp $(WORKSRC)/lib/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin \
	    $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin \
	         $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin
	@mkdir -p $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa/dragon-q8b
	@cp $(WORKSRC)/lib/firmware/qcom/sc8280xp/radxa/dragon-q8b/SC8280XP-Radxa-Dragon-Q8B-tplg.bin \
	    $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa/dragon-q8b/
	@ln -srf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa/dragon-q8b/SC8280XP-Radxa-Dragon-Q8B-tplg.bin \
	         $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/radxa/dragon-q6a/QCS6490-Radxa-Dragon-Q6A-tplg.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/qcs6490/QCS6490-Radxa-Dragon-Q6A-tplg.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/radxa/dragon-q8b/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/qcom/sc8280xp/SC8280XP-Radxa-Dragon-Q8B-tplg.bin
