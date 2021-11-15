
DEPENDS   += python3/python python3/python-setuptools
BUILDDEPS += python3/python python3/python-setuptools python3/python-crossenv

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

GAR_EXTRA_CONF += package-api.mk
include ../../gar.mk

build-%/setup.py:
ifneq ($(DESTIMG),build)
	@echo " ==> Setup crossenv and running setup.py build in $*"
	@cd $* && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
else
	@echo " ==> Running setup.py build in $*"
	@cd $* && $(CONFIGURE_ENV) $(BUILD_ENV) python3 setup.py $(CONFIGURE_ARGS) build $(BUILD_ARGS)
endif
	@$(MAKECOOKIE)

install-%/setup.py: 
ifneq ($(DESTIMG),build)
	@echo " ==> Setup crossenv and running setup.py install in $*"
	@cd $* && . $(build_DESTDIR)$(build_bindir)/python3-crossenv/bin/activate && python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
else
	@echo " ==> Running setup.py install in $*"
	@cd $* && $(CONFIGURE_ENV) $(INSTALL_ENV) python3 setup.py $(CONFIGURE_ARGS) install --skip-build $(INSTALL_ARGS)
endif
	@$(MAKECOOKIE)
