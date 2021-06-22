GARNAME      = qca9377-firmware
GARVERSION   = b0e387c73e6e09d7cd76302e1844f2dd01c25b6f
CATEGORIES   = firmware
MASTER_SITES = https://github.com/LibreELEC/qca-firmware/archive/
DISTFILES    = $(GARVERSION).zip
LICENSE      =
DESCRIPTION  =
define BLURB
endef

WORKSRC = $(WORKDIR)/qca-firmware-$(GARVERSION)

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@rm -rf $(DESTDIR)$(elibdir)/firmware/ath10k/QCA9377/hw1.0/firmware-*
	@rm -rf $(DESTDIR)$(elibdir)/firmware/ath10k/QCA9377/hw1.0/notice_ath10k_firmware-*
	@cp -Rdf $(WORKSRC)/ath10k/QCA9377 $(DESTDIR)$(elibdir)/firmware/ath10k/
	@$(MAKECOOKIE)

clean-all: clean
	@rm -rf $(DESTDIR)$(elibdir)/firmware/ath10k/QCA9377hw1.0/board-sdio.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/ath10k/QCA9377hw1.0/firmware-sdio-5.bin
	@rm -rf $(DESTDIR)$(elibdir)/firmware/ath10k/QCA9377hw1.0/notice.txt
