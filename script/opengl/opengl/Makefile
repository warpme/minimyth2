GARNAME = opengl
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa) \
	$(if $(filter lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa-lima) \
	$(if $(filter mali450,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mali450) \
	$(if $(filter mali450x,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mali450x) \
	$(if $(filter bcrm-vc4,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/bcrm-vc4) \
	$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa-demos) \
	$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/glu) \
	$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/freeglut) \
	$(CATEGORY)/glmark2 \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../mesa ../mesa-lima ../mali450 ../mali450x ../rpi-bcrm ../mesa-demos ../glu ../freeglut ../glew ../virtualgl ../glmark2), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
