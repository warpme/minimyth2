#--Use this for mainline x.y.z kernel-------
ifeq (1,1)
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 5
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = 
endif
#-------------------------------------------

#--Use this for RC mainline kernel----------
ifeq (0,1)
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 5
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = -rc7
endif
#-------------------------------------------

#--Use this for mainline git-commit kernel--
ifeq (0,1)
GITHASH             = 84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d
LINUX_MAJOR_VERSION = 4
LINUX_MINOR_VERSION = 20
LINUX_TEENY_VERSION = 0
LINUX_EXTRA_VERSION = 
endif
#-------------------------------------------

#--Use this for amlogic media-tree kernel---
ifeq (0,1)
GITHASH             = a9e4990fa2c2b7defc47a0053371e5691d80fcdb
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 4
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = -rc8
endif
#-------------------------------------------

#--Use this for Chewitt amlogic kernel------
ifeq (0,1)
GITHASH             = 25f7644a10234313b7040d98e668a94e87532ddf
LINUX_MAJOR_VERSION = 5
LINUX_MINOR_VERSION = 5
LINUX_TEENY_VERSION = 
LINUX_EXTRA_VERSION = -rc1
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
