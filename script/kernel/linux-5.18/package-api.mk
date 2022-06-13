#--Use this for mainline x.y.z kernel-------
ifeq (1,1)
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 18
LINUX_TEENY_VERSION = 3
LINUX_EXTRA_VERSION = 
endif
#-------------------------------------------

#--Use this for first release of mainline kernel
ifeq (0,1)
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 18
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = 
endif
#-------------------------------------------

#--Use this for RC mainline kernel----------
ifeq (0,1)
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 18
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = -rc7
endif
#-------------------------------------------

LINUX_VERSION      = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION))$(LINUX_EXTRA_VERSION)
LINUX_FULL_VERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION),.0)$(LINUX_EXTRA_VERSION)

LINUX_DIR           = $(rootdir)/boot
LINUX_MODULESPREFIX = $(rootdir)/lib/modules
LINUX_INCLUDEDIR    = $(rootdir)/usr
LINUX_MODULESDIR    = $(LINUX_MODULESPREFIX)/$(LINUX_FULL_VERSION)
LINUX_SOURCEDIR     = $(LINUX_MODULESDIR)/source
LINUX_BUILDDIR      = $(LINUX_MODULESDIR)/build

LINUX_MAKEFILE = $(DESTDIR)$(LINUX_SOURCEDIR)/Makefile

LINUX_MAKE_ARGS = \
	ARCH="$(GARCH_FAMILY)" \
	HOSTCC="$(build_CC)" \
	HOSTCXX="$(build_CXX)" \
	HOSTCFLAGS="$(build_CFLAGS)" \
	HOSTCXXFLAGS="$(build_CXXFLAGS)" \
	CROSS_COMPILE="$(compiler_prefix)" \
	$(PARALLELMFLAGS)

LINUX_MAKE_ENV = \
	KBUILD_VERBOSE="0"
