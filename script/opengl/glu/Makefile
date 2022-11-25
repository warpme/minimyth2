GARNAME       = glu
GARVERSION    = 9.0.1
CATEGORIES    = $(CATEGORY)
MASTER_SITES  = https://mesa.freedesktop.org/archive/glu/
DISTFILES     = $(DISTNAME).tar.xz
LICENSE       =

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lang/cxx \
	$(if $(filter mesa,$(mm_OPENGL_PROVIDER)),$(CATEGORY)/mesa) \

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

CONFIGURE_SCRIPTS  = $(WORKSRC)/configure
BUILD_SCRIPTS      = $(WORKSRC)/Makefile
INSTALL_SCRIPTS    = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-silent-rules \
	--disable-debug \
	--disable-osmesa \
	--disable-static \

include ../../gar.mk

git//%$(DISTNAME).tar.bz2:
	@$(call FETCH_GIT, $*, $(word 3,$(subst -, ,$(GARVERSION))), $(DISTNAME))
	@$(MAKECOOKIE)

checksum-$(DISTNAME).tar.bz2:
	@$(MAKECOOKIE) 

pre-configure:
	@$(call RUN_AUTOTOOLS)
	@$(MAKECOOKIE)

post-configure:
	@# hack to fix failed build due double pipe in nm commnds
	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
	@$(MAKECOOKIE)

post-install:
	@rm -f $(DESTDIR)$(libdir)/libGLU.la
	@$(MAKECOOKIE)
