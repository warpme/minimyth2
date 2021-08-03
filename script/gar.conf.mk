#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4

# This file contains configuration variables that are global to
# the GAR system.  Users wishing to make a change on a
# per-package basis should edit the category/package/Makefile, or
# specify environment variables on the make command-line.

# Variables that define the default *actions* (rather than just
# default data) of the system will remain in bbc.gar.mk
# (bbc.port.mk)

# Setting this variable will cause the results of your builds to
# be cleaned out after being installed.  Uncomment only if you
# desire this behavior!

# export BUILD_CLEAN = true

ALL_DESTIMGS = main build

# These are the standard directory name variables from all GNU
# makefiles.  They're also used by autoconf, and can be adapted
# for a variety of build systems.
# 
# Directory config for the "main" image
main_rootdir ?= 
# Warning: any changes to these paths will cause certain packages to break.
main_prefix = $(main_rootdir)/usr
main_exec_prefix = $(main_rootdir)/usr
main_ebindir = $(main_rootdir)/bin
main_bindir = $(main_rootdir)/usr/bin
main_esbindir = $(main_rootdir)/sbin
main_sbindir = $(main_rootdir)/usr/sbin
main_libexecdir = $(main_rootdir)/usr/libexec
main_datadir = $(main_rootdir)/usr/share
main_sysconfdir = $(main_rootdir)/etc
main_sharedstatedir = $(main_rootdir)/usr/share
main_localstatedir = $(main_rootdir)/var
main_elibdir = $(main_rootdir)/lib
main_libdir = $(main_rootdir)/usr/lib
main_elibdir64 = $(main_rootdir)/lib64
main_infodir = $(main_rootdir)/usr/info
main_lispdir = $(main_rootdir)/usr/share/emacs/site-lisp
main_includedir = $(main_rootdir)/usr/include
main_oldincludedir = $(main_rootdir)/usr/include
main_mandir = $(main_rootdir)/usr/share/man
main_docdir = $(main_rootdir)/usr/share/doc
main_sourcedir = $(main_rootdir)/usr/src
main_licensedir = $(main_rootdir)/usr/licenses
main_versiondir = $(main_rootdir)/usr/versions
main_qt4prefix = $(main_libdir)/qt4
main_qt4bindir = $(main_qt4prefix)/bin
main_qt4includedir = $(main_qt4prefix)/include
main_qt4libdir = $(main_qt4prefix)/lib
main_qt5prefix = $(main_libdir)/qt5
main_qt5bindir = $(main_qt5prefix)/bin
main_qt5includedir = $(main_qt5prefix)/include
main_qt5libdir = $(main_qt5prefix)/lib

# Directory config for the "build" image
build_rootdir ?= $(mm_HOME)/images/build
# Warning: any changes to these paths will cause certain packages to break.
build_prefix = $(build_rootdir)/usr
build_exec_prefix = $(build_rootdir)/usr
build_ebindir = $(build_rootdir)/bin
build_bindir = $(build_rootdir)/usr/bin
build_esbindir = $(build_rootdir)/sbin
build_sbindir = $(build_rootdir)/usr/sbin
build_libexecdir = $(build_rootdir)/usr/libexec
build_datadir = $(build_rootdir)/usr/share
build_sysconfdir = $(build_rootdir)/etc
build_sharedstatedir = $(build_rootdir)/usr/share
build_localstatedir = $(build_rootdir)/var
build_elibdir = $(build_rootdir)/lib
build_libdir = $(build_rootdir)/usr/lib
build_elibdir64 = $(build_rootdir)/lib64
build_infodir = $(build_rootdir)/usr/info
build_lispdir = $(build_rootdir)/usr/share/emacs/site-lisp
build_includedir = $(build_rootdir)/usr/include
build_oldincludedir = $(build_rootdir)/usr/include
build_mandir = $(build_rootdir)/usr/share/man
build_docdir = $(build_rootdir)/usr/share/doc
build_sourcedir = $(build_rootdir)/usr/src
build_licensedir = $(build_rootdir)/usr/licenses
build_versiondir = $(build_rootdir)/usr/versions
build_qt4prefix = $(build_libdir)/qt4
build_qt4bindir = $(build_qt4prefix)/bin
build_qt4includedir = $(build_qt4prefix)/include
build_qt4libdir = $(build_qt4prefix)/lib
build_qt5prefix = $(build_libdir)/qt5
build_qt5bindir = $(build_qt5prefix)/bin
build_qt5includedir = $(build_qt5prefix)/include
build_qt5libdir = $(build_qt5prefix)/lib

# the DESTDIR is used at INSTALL TIME ONLY to determine what the
# filesystem root should be.  Each different DESTIMG has its own
# DESTDIR.
main_DESTDIR ?= $(mm_HOME)/images/main
build_DESTDIR ?= /
build_chroot_DESTDIR ?= /tmp/chroot

# allow us to link to libraries we installed
main_CPPFLAGS += 
main_CFLAGS += -pipe 
main_CFLAGS += $(mm_CFLAGS)
main_CXXFLAGS += $(main_CFLAGS)

main_LDFLAGS += -Wl,--as-needed $(main_CFLAGS)

# allow us to link to libraries we installed
build_CPPFLAGS += 
build_CFLAGS += -pipe -march=$(build_GARCH) -O2 $(if $(filter i386,$(build_GARCH_FAMILY)),-m32) $(if $(filter x86_64,$(build_GARCH_FAMILY)),-m64)
build_CXXFLAGS += $(build_CFLAGS)
build_LDFLAGS += $(build_CFLAGS)

# Default main_CC to gcc, $(DESTIMG)_CC to main_CC and set CC based on $(DESTIMG)
main_compiler_prefix ?= $(GARHOST)-
main_CC = $(main_compiler_prefix)gcc
main_CXX = $(main_compiler_prefix)g++
main_LD = $(main_compiler_prefix)ld
main_OBJDUMP = $(main_compiler_prefix)objdump
main_OBJCOPY = $(main_compiler_prefix)objcopy
main_STRIP = $(main_compiler_prefix)strip
main_RANLIB = $(main_compiler_prefix)ranlib
main_NM = $(main_compiler_prefix)nm
main_AS = $(main_compiler_prefix)as
main_AR = $(main_compiler_prefix)ar
main_CPP = $(main_compiler_prefix)cpp
build_compiler_prefix ?= 
build_CC = $(build_compiler_prefix)gcc
build_CXX = $(build_compiler_prefix)g++
build_LD = $(build_compiler_prefix)ld
build_OBJDUMP = $(build_compiler_prefix)objdump
build_OBJCOPY = $(build_compiler_prefix)objcopy
build_STRIP = $(build_compiler_prefix)strip
build_RANLIB = $(build_compiler_prefix)ranlib
build_NM = $(build_compiler_prefix)nm
build_AS = $(build_compiler_prefix)as
build_AR = $(build_compiler_prefix)ar
build_CPP = $(build_compiler_prefix)cpp

# GARCH and GARHOST for main.  Override these for cross-compilation
main_GARCH ?= $(mm_GARCH)
main_GARCH_FAMILY ?= $(mm_GARCH_FAMILY)
main_GARHOST ?= $(mm_GARHOST)

# GARCH and GARHOST for build.  Do not change these.
build_GARCH := $(strip $(subst x86_64,x86-64, \
    $(if $(filter-out unknown,$(shell uname -m)), \
        $(shell uname -m) \
    , \
        $(shell arch) \
    )))
build_GARCH_FAMILY := $(strip \
    $(if $(filter i386 i486 i586 i686,$(build_GARCH)),i386  ) \
    $(if $(filter x86-64             ,$(build_GARCH)),x86_64))
build_GARHOST := $(GARBUILD)

# Don't build these packages as in the build image
build_NODEPEND += kernel/linux-headers devel/glibc

# This is for foo-config chaos
SHELL = $(if $(wildcard $(build_DESTDIR)$(build_ebindir)/bash),$(build_DESTDIR)$(build_ebindir)/bash,/bin/sh)
CONFIG_SHELL = $(SHELL)
PKG_CONFIG_PATH = 
PKG_CONFIG_LIBDIR = $(DESTDIR)$(libdir)/pkgconfig:$(DESTDIR)$(datadir)/pkgconfig:$(DESTDIR)$(qt5libdir)/pkgconfig
PKG_CONFIG_SYSROOT_DIR = $(DESTDIR)
PERLLIB = 
PERL5LIB =

# Put these variables in the environment during the
# configure build and install stages
STAGE_EXPORTS = DESTDIR prefix exec_prefix bindir sbindir libexecdir datadir
STAGE_EXPORTS += sysconfdir sharedstatedir localstatedir libdir infodir lispdir
STAGE_EXPORTS += includedir oldincludedir mandir docdir sourcedir
STAGE_EXPORTS += CPPFLAGS CFLAGS LDFLAGS CXXFLAGS
STAGE_EXPORTS += CC CXX LD CPP AR AS NM RANLIB STRIP OBJCOPY OBJDUMP

CONFIGURE_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
BUILD_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
INSTALL_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")
MANIFEST_ENV += $(foreach TTT,$(STAGE_EXPORTS),$(TTT)="$($(TTT))")

# Global environment
export GARBUILD
export BUILD_SYSTEM_PATH GAR_SYSTEM_PATH PATH LIBRARY_PATH LD_LIBRARY_PATH #LD_PRELOAD
export SHELL CONFIG_SHELL
export PKG_CONFIG_PATH PKG_CONFIG_LIBDIR PKG_CONFIG_SYSROOT_DIR
export PERLLIB PERL5LIB

GARCHIVEROOT ?= $(mm_HOME)/source
GARCHIVEDIR = $(GARCHIVEROOT)/$(DISTNAME)
GARPKGROOT ?= /var/www/garpkg
GARPKGDIR = $(GARPKGROOT)/$(GARNAME)

# prepend the local file listing
FILE_SITES = file://$(FILEDIR)/ file://$(GARCHIVEDIR)/

#append the public archive
MASTER_SITES += http://warped.inet2.org/pkg/minimyth2-garchive/$(GARNAME)-$(GARVERSION)/

# Extra confs to include after gar.conf.mk
GAR_EXTRA_CONF += extras/extras.conf.mk devel/gcc/package-api.mk

# Extra libs to include with gar.mk
GAR_EXTRA_LIBS += minimyth.lib.mk
