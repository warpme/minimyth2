
GARNAME    = qt
GARVERSION = meta
CATEGORIES = qt
LICENSE    =

DESCRIPTION = 
define BLURB
endef

include ../../minimyth.conf.mk

DEPENDS = \
	$(if $(filter qt5,$(mm_QT_VERSION)), qt/qt5 qt/qt5-webkit) \
	$(if $(filter qt6,$(mm_QT_VERSION)), qt/qt6) \

clean-all: clean
	@$(foreach dir, $(wildcard ../qt5*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../qt6*), $(MAKE) clean-all -C $(dir) ; )

include ../../gar.mk
