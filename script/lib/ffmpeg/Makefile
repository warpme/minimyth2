
GARNAME    = ffmpeg
GARVERSION = meta
CATEGORIES = lib
LICENSE    =

DESCRIPTION = 
define BLURB
endef

include ../../minimyth.conf.mk

DEPENDS = \
	$(if $(filter 8.1,$(mm_FFMPEG_VERSION)), lib/ffmpeg8.1-mythtv) \
	$(if $(filter 9.0,$(mm_FFMPEG_VERSION)), lib/ffmpeg9.0-mythtv) \

clean-all: clean
	@$(foreach dir, $(wildcard ../ffmpeg*), $(MAKE) clean -C $(dir) ; )

include ../../gar.mk
