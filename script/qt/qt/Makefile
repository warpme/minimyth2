
GARNAME    = qt
GARVERSION = meta
CATEGORIES = qt
LICENSE    =

DESCRIPTION = 
define BLURB
endef

include ../../minimyth.conf.mk

DEPENDS = \
	$(if $(filter qt5,$(mm_QT_VERSION)), qt/qt5) \
	$(if $(filter qt6,$(mm_QT_VERSION)), qt/qt6) \
	$(if $(filter mythbrowser,$(mm_SOFTWARE)),qt/qt5-webkit) \

clean-all: clean
	@$(foreach dir, $(wildcard ../qt5*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../qt6*), $(MAKE) clean-all -C $(dir) ; )

include ../../gar.mk
