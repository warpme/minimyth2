
DEPENDS   += python3/python python3/python-setuptools
BUILDDEPS += python3/python python3/python-setuptools

BUILD_SCRIPTS   = $(WORKSRC)/setup.py
INSTALL_SCRIPTS = $(WORKSRC)/setup.py

include ../../gar.mk
GAR_EXTRA_CONF += package-api.mk

# Turn-off LTO to save size
CFLAGS   := $(filter-out -flto, $(CFLAGS))
CXXFLAGS := $(filter-out -flto, $(CXXFLAGS))
LDFLAGS  := $(filter-out -flto, $(LDFLAGS))

# Turn-off -O3 to save size
CFLAGS   := $(filter-out -O%, $(CFLAGS)) -Os
CXXFLAGS := $(filter-out -O%, $(CXXFLAGS)) -Os
LDFLAGS  := $(filter-out -O%, $(LDFLAGS)) -Os

pre-configure:
ifeq ($(DESTIMG),build)
	echo "Setting _sysconfigdata__linux_x86_64-linux-gnu.py to host config as DESTIMG=build"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.build \
          $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc

endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	echo "Restoring _sysconfigdata__linux_x86_64-linux-gnu.py to target config as DESTIMG=main"; \
	cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py.main \
	      $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata__linux_x86_64-linux-gnu.py; \
	rm -f $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/__pycache__/_sysconfigdata__*.pyc
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
