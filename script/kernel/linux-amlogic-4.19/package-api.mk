
#--Use this for mainline kernel-------------------------------
#GITHASH             = 84df9525b0c27f3ebc2ebb1864fa62a97fdedb7d
#LINUX_MAJOR_VERSION = 4
#LINUX_MINOR_VERSION = 19
#LINUX_TEENY_VERSION = 0
#LINUX_EXTRA_VERSION = 
#-------------------------------------------------------------

#--Use this for khadas kernel---------------------------------
# GITHASH             = b0ee9f50b8030b8dd9b26eb7b5cdef5bdbda4f35
# LINUX_MAJOR_VERSION = 4
# LINUX_MINOR_VERSION = 19
# LINUX_TEENY_VERSION = 0
# LINUX_EXTRA_VERSION = 
#-------------------------------------------------------------

#-- Use this for Elyotna kernel-------------------------------
# GITHASH             = c8f093d221aa4f91c372b880ff4d1b8c7dc78664
# LINUX_MAJOR_VERSION = 4
# LINUX_MINOR_VERSION = 19
# LINUX_TEENY_VERSION = 0
# LINUX_EXTRA_VERSION = 
#-------------------------------------------------------------

#--Use this for balbes150 kernel------------------------------
# GITHASH             = 2b66eefe06f198f98668871fb0e3dc9007cfd25d
# LINUX_MAJOR_VERSION = 4
# LINUX_MINOR_VERSION = 19
# LINUX_TEENY_VERSION = 0
# LINUX_EXTRA_VERSION = -rc7
#-------------------------------------------------------------

#--Use this for yuq lima kernel-------------------------------
GITHASH             = 5e99965d39976e015bdb0a8010f14e644a27989e
LINUX_MAJOR_VERSION = 4
LINUX_MINOR_VERSION = 19
LINUX_TEENY_VERSION = 0
LINUX_EXTRA_VERSION = -rc4
#-------------------------------------------------------------


#--Use this for official kernel git for AMLogic (khilman)-----
# LINUX_MAJOR_VERSION = 4
# LINUX_MINOR_VERSION = 19
# LINUX_TEENY_VERSION = 0
# LINUX_EXTRA_VERSION = 
#-------------------------------------------------------------



LINUX_VERSION      = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION))$(LINUX_EXTRA_VERSION)
LINUX_FULL_VERSION = $(LINUX_MAJOR_VERSION).$(LINUX_MINOR_VERSION)$(if $(LINUX_TEENY_VERSION),.$(LINUX_TEENY_VERSION),.0)$(LINUX_EXTRA_VERSION)

LINUX_DIR           = $(rootdir)/boot
LINUX_DIR           = $(rootdir)/boot
LINUX_MODULESPREFIX = $(rootdir)/lib/modules
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
	KBUILD_VERBOSE="1"
