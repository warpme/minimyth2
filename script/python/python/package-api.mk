PYTHON_VERSION_MAJOR = 2
PYTHON_VERSION_MINOR = 7
PYTHON_VERSION_TEENY = 15
PYTHON_VERSION = $(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)$(if $(filter-out 0,$(PYTHON_VERSION_TEENY)),.$(PYTHON_VERSION_TEENY))

PYTHON_includedir = $(includedir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
PYTHON_libdir = $(libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
build_PYTHON_includedir = $(build_includedir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)
build_PYTHON_libdir = $(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)

pre-configure:
ifeq ($(DESTIMG),build)
	@# This is required as python-mysql-python can be asked to build still for host when python is
	@# switched already for building for target (_sysconfigdata.py=_sysconfigdata.py.main)
	@echo "Setting _sysconfigdata.py to host config as DESTIMG=build"
	@if [ -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.buildcp ] ; then \
	 cp -v $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.build $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py ; \
	 fi
endif
	@$(MAKECOOKIE)

post-install:
ifeq ($(DESTIMG),build)
	@echo "Restoring _sysconfigdata.py to target config as DESTIMG=main"
	@if [ -e $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.main ] ; then \
	 cp -v  $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py.main \
	 $(build_DESTDIR)$(build_libdir)/python$(PYTHON_VERSION_MAJOR).$(PYTHON_VERSION_MINOR)/_sysconfigdata.py ; \
	 fi
endif
	@$(MAKECOOKIE)
