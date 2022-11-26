
GARNAME    = xorg
GARVERSION = $(XORG_VERSION)
CATEGORIES = $(CATEGORY)
LICENSE    =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(CATEGORY)/iceauth \
	$(CATEGORY)/libX11 \
	$(CATEGORY)/libxcomposite \
	$(CATEGORY)/libXdamage \
	$(CATEGORY)/libXdmcp \
	$(CATEGORY)/libXext \
	$(CATEGORY)/libXfixes \
	$(CATEGORY)/libXft \
	$(CATEGORY)/libXinerama \
	$(CATEGORY)/libxkbcommon \
	$(CATEGORY)/libXmu \
	$(CATEGORY)/libXpm \
	$(CATEGORY)/libXrandr \
	$(CATEGORY)/libXrender \
	$(CATEGORY)/libXres \
	$(CATEGORY)/libXt \
	$(CATEGORY)/libXtst \
	opengl/opengl \
	$(CATEGORY)/mkfontdir \
	$(CATEGORY)/mkfontscale \
	$(CATEGORY)/rgb \
	$(CATEGORY)/xcb-util-image \
	$(CATEGORY)/xcb-util-keysyms \
	$(CATEGORY)/xcb-util-wm \
	$(CATEGORY)/xcb-util-renderutil \
	$(CATEGORY)/xdpyinfo \
	$(CATEGORY)/xev \
	$(if $(filter-out build, $(DESTIMG)), \
		$(CATEGORY)/xf86-input-evdev \
		$(CATEGORY)/xf86-input-void \
		$(if $(filter radeon,$(mm_GRAPHICS)),$(CATEGORY)/xf86-video-ati) \
		$(if $(filter intel, $(mm_GRAPHICS)),$(CATEGORY)/xf86-video-intel) \
		$(if $(filter vmware,$(mm_GRAPHICS)),$(CATEGORY)/xf86-video-vmware) \
		$(if $(filter armsoc,$(mm_GRAPHICS)), \
			$(CATEGORY)/xf86-video-armsoc) \
	) \
	$(CATEGORY)/xinit \
	$(CATEGORY)/xkbcomp \
	$(CATEGORY)/xkeyboard-config \
	$(CATEGORY)/xlsclients \
	$(CATEGORY)/xmodmap \
	$(CATEGORY)/xorg-server \
	$(CATEGORY)/xrandr \
	$(CATEGORY)/xset \
	$(CATEGORY)/xsetroot \
	$(CATEGORY)/xauth


CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)
