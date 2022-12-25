
DEPENDS   += python3/python python3/python-setuptools
BUILDDEPS += python3/python python3/python-setuptools

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

include ../../gar.mk
GAR_EXTRA_CONF += package-api.mk
include ../../python3/python/package-api.mk

# Turn-off LTO to save size
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

# Turn-off -O3 to save size
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -Os -I$(DESTDIR)$(includedir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -Os
LDFLAGS  := $(filter-out -O%, $(LDFLAGS)) -Os

pre-configure:
ifeq ($(DESTIMG),build)
	@$(call PYTHON3_SET_BUILD_SYSCONF)
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@$(call PYTHON3_SET_MAIN_SYSCONF)
endif
	@$(MAKECOOKIE)

build-%/setup.py:
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
	@$(MAKECOOKIE)

install-%/setup.py: 
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
	@$(MAKECOOKIE)
