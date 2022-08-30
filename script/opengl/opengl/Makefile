GARNAME = opengl
CATEGORIES = $(CATEGORY)
LICENSE =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa) \
	$(if $(filter mesa-git,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa-git) \
	$(if $(filter brcm-vc4,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/brcm-vc4) \
	$(if $(filter mesa mesa-git,$(mm_OPENGL_PROVIDER)), \
		$(CATEGORY)/gslang \
		$(CATEGORY)/freeglut \
		$(CATEGORY)/glu) \
	$(if $(filter glmark2,$(mm_SOFTWARE)),$(CATEGORY)/glmark2) \
	$(if $(filter kmscube,$(mm_SOFTWARE)),$(CATEGORY)/kmscube) \
	$(if $(filter mesa-demos,$(mm_SOFTWARE)),$(CATEGORY)/mesa-demos) \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../mesa ../mesa-git ../brcm-vc4 ../mesa-demos ../glu ../freeglut ../glew ../virtualgl ../glmark2 ../kmscube ../gslang), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
