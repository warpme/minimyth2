
GARNAME      = Monochrome-mm2
# Git master from 14.05.2023
GARVERSION   = e0b737087fefe426660f34d51d4a015a7a7936c4
CATEGORIES   = mythtv
MASTER_SITES = https://github.com/hambre/Monochrome/archive/
DISTFILES    = $(GARVERSION).zip

PATCHFILES   = add-mm2-ui-notifications.patch
PATCHFILES  += change-running-color-to-amber.patch
PATCHFILES  += improve-osd-playback-stats.patch
PATCHFILES  += osd--add-osdnavigation.patch
PATCHFILES  += modify-rec-in-progress-in-scheduled-ui.patch
PATCHFILES  += modify-watched-progressbar-in-recordings-ui.patch
PATCHFILES  += browser-ui-enhacemets.patch
PATCHFILES  += add-current-next-rec-in-standby-screen.patch
PATCHFILES  += add-zoneminder-support.patch
PATCHFILES  += add-right-arrow-to-list-episodes.patch
PATCHFILES  += add-virtual-keyboard.patch
PATCHFILES  += add-osd_subtitle-xml.patch
PATCHFILES  += video-ui-remove-cond-disp-tile-on-presence-00x00.patch
PATCHFILES  += music-ui.xml-applay-mythtv-pull774.patch
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
	@mkdir -p $(DESTDIR)$(datadir)/mythtv/themes/Monochrome-mm2
	@cp -Rdf $(WORKSRC)/* $(DESTDIR)$(datadir)/mythtv/themes/Monochrome-mm2/
	@$(MAKECOOKIE)

clean-all: clean
	rm -rf $(DESTDIR)$(datadir)/mythtv/themes/Monochrome*
