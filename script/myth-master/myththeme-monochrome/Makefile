
GARNAME      = Monochrome
# Git master from 26.04.2022
GARVERSION   = 8569391fd35dc01aaec19f8085b3002ede8148b2
CATEGORIES   = mythtv
MASTER_SITES = https://github.com/hambre/Monochrome/archive/
DISTFILES    = $(GARVERSION).zip

PATCHFILES   = add-mm2-ui-notifications.patch
PATCHFILES  += change-running-color-to-amber.patch
PATCHFILES  += improve-osd-playback-stats-add-osdnavigation.patch
PATCHFILES  += modify-watched-progressbar-in-recordings-ui-and-scheduled.patch
PATCHFILES  += browser-ui-mode-browser-wintod-to-end.patch
# PATCHFILES  += add-snow-animations.patch

LICENSE      = GPL2
DESCRIPTION  =
WORKSRC      = $(WORKDIR)/Monochrome-$(GARVERSION)

define BLURB
endef

DEPENDS = lang/c

INSTALL_SCRIPTS = custom

include ../../gar.mk

install-custom:
	@mkdir -p $(DESTDIR)$(datadir)/mythtv/themes/Monochrome
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(datadir)/mythtv/themes/Monochrome/
	@$(MAKECOOKIE)

clean-all: clean
	rm -rf $(DESTDIR)$(datadir)/mythtv/themes/Monochrome*
