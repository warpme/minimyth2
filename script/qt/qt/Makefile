
GARNAME    = qt
GARVERSION = meta
CATEGORIES = $(CATEGORY)
LICENSE    =

DESCRIPTION = 
define BLURB
endef

CATEGORY := $(shell basename $(shell dirname $(shell pwd)))

include ../../minimyth.conf.mk

DEPENDS = \
	$(if $(filter 5,$(mm_QT_VERSION)),$(CATEGORY)/qt5 $(CATEGORY)/qt5-webkit) \
	$(if $(filter 6,$(mm_QT_VERSION)),$(CATEGORY)/qt6) \

clean-all: clean
	@$(foreach dir, $(wildcard ../$(CATEGORY)-*), $(MAKE) clean     -C $(dir) ; )
	@$(foreach dir, $(wildcard ../$(CATEGORY)-*), $(MAKE) clean-all -C $(dir) ; )

include ../../gar.mk
