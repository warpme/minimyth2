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
	$(if $(filter brcm-vc4,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/brcm-vc4) \
	$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/glu) \
	$(if $(filter mesa lima,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/freeglut) \
	$(if $(filter glmark2,$(mm_SOFTWARE)),$(CATEGORY)/glmark2) \
	$(if $(filter kmscube,$(mm_SOFTWARE)),$(CATEGORY)/kmscube) \
	$(if $(filter mesa-demos,$(mm_SOFTWARE)),$(CATEGORY)/mesa-demos) \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../mesa ../mesa-lima ../mali450 ../mali450x ../brcm-vc4 ../mesa-demos ../glu ../freeglut ../glew ../virtualgl ../glmark2 ../kmscube), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
