XORG_VERSION      = 7.3
XORG_MASTER_SITES = \
	https://xorg.freedesktop.org/releases/individual/lib/ \
	$(foreach                                                               \
		dir,                                                            \
		app data doc driver everything font lib proto xcb util xserver, \
	        https://xorg.freedesktop.org/releases/individual/$(dir)/        \
	) \
	http://xcb.freedesktop.org/dist/
