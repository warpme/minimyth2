
GARNAME    = opengl
LICENSE    =

DESCRIPTION = 
define BLURB
endef

DEPENDS = \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),opengl/mesa) \
	$(if $(filter mesa-git,$(mm_OPENGL_PROVIDER)),opengl/mesa-git) \
	$(if $(filter brcm-vc4,$(mm_OPENGL_PROVIDER)),opengl/brcm-vc4) \
	$(if $(filter mesa mesa-git,$(mm_OPENGL_PROVIDER)), \
		opengl/glslang \
		opengl/freeglut \
		opengl/glu) \
	$(if $(filter glmark2,$(mm_SOFTWARE)),opengl/glmark2) \
	$(if $(filter kmscube,$(mm_SOFTWARE)),opengl/kmscube) \
	$(if $(filter mesa-demos,$(mm_SOFTWARE)),opengl/mesa-demos) \

include ../../gar.mk

clean-all:
	@$(foreach dir, $(wildcard ../mesa ../mesa-git ../brcm-vc4 ../mesa-demos ../glu ../freeglut ../glew ../virtualgl ../glmark2 ../kmscube ../gslang), $(MAKE) clean clean-all -C $(dir) ; )
	@$(MAKE) clean
