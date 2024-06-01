
GARNAME    = meta
GARVERSION = $(GST_VERSION)
CATEGORIES = $(CATEGORY)
LICENSE    =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(CATEGORY)/gstreamer        \
	$(CATEGORY)/gst-plugins-base \
	$(CATEGORY)/gst-libav        \
	$(CATEGORY)/gst-plugins-good \
	$(CATEGORY)/gst-plugins-bad  \
	$(CATEGORY)/gst-plugins-ugly \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

post-install:
	@rm -rf $(DESTDIR)$(versiondir)/$(GARNAME)
	@rm -rf $(DESTDIR)$(licensedir)/$(GARNAME)
	@$(MAKECOOKIE)

clean-all:
	@$(foreach dir, $(wildcard ../gst-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../gst-*), $(MAKE) clean-all -C $(dir) ; )
	@$(MAKE) clean     ../gstreamer -C ../gstreamer
	@$(MAKE) clean-all ../gstreamer -C ../gstreamer
