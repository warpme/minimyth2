#-*- mode: Fundamental; tab-width: 4; -*-
# ex:ts=4 sw=4

# Copyright (C) 2001 Nick Moffitt
# 
# Redistribution and/or use, with or without modification, is
# permitted.  This software is without warranty of any kind.  The
# author(s) shall not be liable in the event that use of the
# software causes damage.


# Comment this out to make much verbosity
#.SILENT:

#ifeq ($(origin GARDIR), undefined)
#GARDIR := $(CURDIR)/../..
#endif

####### Invariants #######
GARDIR ?= ../..

# GARBUILD is the platform on which you're running GAR.  If you want to
# override it with a value other than what GCC thinks it's running on that's
# ok, but the results will be very... VERY ...strange.
GARBUILD ?= $(shell gcc -dumpmachine)

# include the configuration file to override any of these variables
# no variable expansions or targets are allowed in these files.
include $(GARDIR)/minimyth.conf.mk
include $(GARDIR)/gar.conf.mk
-include $(addprefix $(GARDIR)/,$(GAR_EXTRA_CONF)) package-api.mk

####### Default values for variables which remain unconfigured. #######

##### Default image configuration #####

# Default DESTIMG
DESTIMG ?= main

# Default image filesystem structure
$(DESTIMG)_rootdir ?= $(main_rootdir)
$(DESTIMG)_prefix ?= $(main_prefix)
$(DESTIMG)_exec_prefix ?= $(main_exec_prefix)
$(DESTIMG)_ebindir ?= $(main_ebindir)
$(DESTIMG)_bindir ?= $(main_bindir)
$(DESTIMG)_esbindir ?= $(main_esbindir)
$(DESTIMG)_sbindir ?= $(main_sbindir)
$(DESTIMG)_libexecdir ?= $(main_libexecdir)
$(DESTIMG)_datadir ?= $(main_datadir)
$(DESTIMG)_sysconfdir ?= $(main_sysconfdir)
$(DESTIMG)_sharedstatedir ?= $(main_sharedstatedir)
$(DESTIMG)_localstatedir ?= $(main_localstatedir)
$(DESTIMG)_elibdir ?= $(main_elibdir)
$(DESTIMG)_libdir ?= $(main_libdir)
$(DESTIMG)_infodir ?= $(main_infodir)
$(DESTIMG)_lispdir ?= $(main_lispdir)
$(DESTIMG)_includedir ?= $(main_includedir)
$(DESTIMG)_oldincludedir ?= $(main_oldincludedir)
$(DESTIMG)_mandir ?= $(main_mandir)
$(DESTIMG)_docdir ?= $(main_docdir)
$(DESTIMG)_sourcedir ?= $(main_sourcedir)
$(DESTIMG)_licensedir ?= $(main_licensedir)
$(DESTIMG)_versiondir ?= $(main_versiondir)
$(DESTIMG)_qt4prefix ?= $(main_qt4prefix)
$(DESTIMG)_qt4bindir ?= $(main_qt4bindir)
$(DESTIMG)_qt4includedir ?= $(main_qt4includedir)
$(DESTIMG)_qt4libdir ?= $(main_qt4libdir)
$(DESTIMG)_qt4qmake ?= $(DESTDIR)$(qt4bindir)/qmake
$(DESTIMG)_qt5prefix ?= $(main_qt5prefix)
$(DESTIMG)_qt5bindir ?= $(main_qt5bindir)
$(DESTIMG)_qt5includedir ?= $(main_qt5includedir)
$(DESTIMG)_qt5libdir ?= $(main_qt5libdir)
$(DESTIMG)_qt5qmake ?= $(DESTDIR)$(qt5bindir)/qmake
$(DESTIMG)_qt6prefix ?= $(main_qt6prefix)
$(DESTIMG)_qt6bindir ?= $(main_qt6bindir)
$(DESTIMG)_qt6includedir ?= $(main_qt6includedir)
$(DESTIMG)_qt6libdir ?= $(main_qt6libdir)
$(DESTIMG)_qt6qmake ?= $(DESTDIR)$(qt6bindir)/host-qmake

$(DESTIMG)_DESTDIR ?= $(main_DESTDIR)

# Default image architecture
$(DESTIMG)_GARCH ?= $(main_GARCH)
$(DESTIMG)_GARCH_FAMILY ?= $(main_GARCH_FAMILY)
$(DESTIMG)_GARHOST ?= $(main_GARHOST)

# Default image tools
$(DESTIMG)_compiler_prefix ?= $(main_compiler_prefix)
$(DESTIMG)_CC ?= $(main_CC)
$(DESTIMG)_CXX ?= $(main_CXX)
$(DESTIMG)_LD ?= $(main_LD)
$(DESTIMG)_OBJDUMP ?= $(main_OBJDUMP)
$(DESTIMG)_OBJCOPY ?= $(main_OBJCOPY)
$(DESTIMG)_STRIP ?= $(main_STRIP)
$(DESTIMG)_RANLIB ?= $(main_RANLIB)
$(DESTIMG)_NM ?= $(main_NM)
$(DESTIMG)_AS ?= $(main_AS)
$(DESTIMG)_AR ?= $(main_AR)
$(DESTIMG)_CPP ?= $(main_CPP)

# Default image tool options
$(DESTIMG)_CPPFLAGS ?= $(main_CPPFLAGS)
$(DESTIMG)_CFLAGS ?= $(main_CFLAGS)
$(DESTIMG)_CXXFLAGS ?= $(main_CXXFLAGS)
$(DESTIMG)_LDFLAGS ?= $(main_LDFLAGS)

##### Set upstream package control variables #####

# Filesystem structure
rootdir = $($(DESTIMG)_rootdir)
prefix = $($(DESTIMG)_prefix)
exec_prefix = $($(DESTIMG)_exec_prefix)
ebindir = $($(DESTIMG)_ebindir)
bindir = $($(DESTIMG)_bindir)
esbindir = $($(DESTIMG)_esbindir)
sbindir = $($(DESTIMG)_sbindir)
libexecdir = $($(DESTIMG)_libexecdir)
datadir = $($(DESTIMG)_datadir)
sysconfdir = $($(DESTIMG)_sysconfdir)
sharedstatedir = $($(DESTIMG)_sharedstatedir)
localstatedir = $($(DESTIMG)_localstatedir)
elibdir = $($(DESTIMG)_elibdir)
elibdir64 = $($(DESTIMG)_elibdir64)
libdir = $($(DESTIMG)_libdir)
infodir = $($(DESTIMG)_infodir)
lispdir = $($(DESTIMG)_lispdir)
includedir = $($(DESTIMG)_includedir)
oldincludedir = $($(DESTIMG)_oldincludedir)
mandir = $($(DESTIMG)_mandir)
docdir = $($(DESTIMG)_docdir)
sourcedir = $($(DESTIMG)_sourcedir)
licensedir = $($(DESTIMG)_licensedir)
versiondir = $($(DESTIMG)_versiondir)
qt4prefix = $($(DESTIMG)_qt4prefix)
qt4bindir = $($(DESTIMG)_qt4bindir)
qt4includedir = $($(DESTIMG)_qt4includedir)
qt4libdir = $($(DESTIMG)_qt4libdir)
qt4qmake = $($(DESTIMG)_qt4qmake)
qt5prefix = $($(DESTIMG)_qt5prefix)
qt5bindir = $($(DESTIMG)_qt5bindir)
qt5includedir = $($(DESTIMG)_qt5includedir)
qt5libdir = $($(DESTIMG)_qt5libdir)
qt5qmake = $($(DESTIMG)_qt5qmake)
qt6prefix = $($(DESTIMG)_qt6prefix)
qt6bindir = $($(DESTIMG)_qt6bindir)
qt6includedir = $($(DESTIMG)_qt6includedir)
qt6libdir = $($(DESTIMG)_qt6libdir)
qt6qmake = $($(DESTIMG)_qt6qmake)

DESTDIR = $($(DESTIMG)_DESTDIR)

ifeq ($(mm_QT_VERSION),qt4)
qtqmake = $(qt4qmake)
else
ifeq ($(mm_QT_VERSION),qt6)
qtqmake = $(qt6qmake)
else
qtqmake = $(qt5qmake)
endif
endif

# Architecture
GARCH = $($(DESTIMG)_GARCH)
GARCH_FAMILY = $($(DESTIMG)_GARCH_FAMILY)
GARHOST = $($(DESTIMG)_GARHOST)

# GARTARGET may be exported from a package with an arbitrary value to indicate
# that dependencies of that package which recognize a "target" platform, such
# as GCC and GNU binutils, should target the specified platform.  The default
# value of $(GARHOST) causes the those packages to produce native tools.
GARTARGET ?= $(GARHOST)

# Tools
compiler_prefix = $($(DESTIMG)_compiler_prefix)
CC = $($(DESTIMG)_CC)
CXX = $($(DESTIMG)_CXX)
LD = $($(DESTIMG)_LD)
OBJDUMP = $($(DESTIMG)_OBJDUMP)
OBJCOPY = $($(DESTIMG)_OBJCOPY)
STRIP = $($(DESTIMG)_STRIP)
RANLIB = $($(DESTIMG)_RANLIB)
NM = $($(DESTIMG)_NM)
AS = $($(DESTIMG)_AS)
AR = $($(DESTIMG)_AR)
CPP = $($(DESTIMG)_CPP)

# Tool options -- These are append-mode assignments so that packages may
# provide additional tool options.
CPPFLAGS += $($(DESTIMG)_CPPFLAGS)
CFLAGS += $($(DESTIMG)_CFLAGS)
CXXFLAGS += $($(DESTIMG)_CXXFLAGS)
LDFLAGS += $($(DESTIMG)_LDFLAGS)

####### Defaults for GAR target control variables #######
DISTNAME ?= $(GARNAME)-$(GARVERSION)
FILEDIR ?= files
DOWNLOADDIR ?= download
PARTIALDIR ?= $(DOWNLOADDIR)/partial
COOKIEROOTDIR ?= cookies
COOKIEDIR ?= $(COOKIEROOTDIR)/$(DESTIMG).d
WORKROOTDIR ?= work
WORKDIR ?= $(WORKROOTDIR)/$(DESTIMG).d
WORKSRC ?= $(WORKDIR)/$(DISTNAME)
EXTRACTDIR ?= $(WORKDIR)
SCRATCHDIR ?= $(WORKROOTDIR)/tmp
CHECKSUM_FILE ?= checksums
MANIFEST_FILE ?= manifest
ALLFILES ?= $(DISTFILES) $(PATCHFILES)
STAGINGDIR ?= $(build_DESTDIR)$(build_prefix)/staging

# allow us to use programs we just built
BUILD_SYSTEM_PATH := $(if $(BUILD_SYSTEM_PATH),$(BUILD_SYSTEM_PATH),$(PATH))
GAR_SYSTEM_PATH := $(DESTDIR)$(bindir)-config:$(build_DESTDIR)$(build_esbindir):$(build_DESTDIR)$(build_ebindir):$(build_DESTDIR)$(build_sbindir):$(build_DESTDIR)$(build_bindir):$(build_DESTDIR)$(build_rootdir)/bin-build-system
PATH := $(if $(wildcard $(build_DESTDIR)$(build_rootdir)/bin-build-system),$(GAR_SYSTEM_PATH),$(GAR_SYSTEM_PATH):$(BUILD_SYSTEM_PATH))
# this causes pain for all involved once glibc is built.
LIBRARY_PATH = $(build_DESTDIR)$(build_elibdir64):$(build_DESTDIR)$(build_elibdir):$(build_DESTDIR)$(build_libdir):$(build_DESTDIR)$(build_qt6libdir):$(build_DESTDIR)$(build_qt5libdir):$(build_DESTDIR)$(build_libdir)/mysql:/lib/$(GARBUILD):/usr/lib/$(GARBUILD)$(strip $(if $(filter i386,$(build_GARCH_FAMILY)),:/lib32:/usr/lib32:/lib:/usr/lib) $(if $(filter x86_64,$(build_GARCH_FAMILY)),:/lib64:/usr/lib64:/lib:/usr/lib))
LD_LIBRARY_PATH = $(build_DESTDIR)$(build_elibdir64):$(build_DESTDIR)$(build_elibdir):$(build_DESTDIR)$(build_libdir):$(build_DESTDIR)$(build_qt6libdir):$(build_DESTDIR)$(build_qt5libdir):$(build_DESTDIR)$(build_libdir)/mysql
# or at least it did before we had DESTDIR and fully-munged
# builddeps.  The following may be more of a hindrance than a
# help nowadays:
#LD_PRELOAD +=/lib/libc.so.6

# XXX: These macros should go in lib
DIRSTODOTS = $(subst . /,./,$(patsubst %,/..,$(subst /, ,/$(1))))
ROOTFROMDEST = $(call DIRSTODOTS,$(DESTDIR))

# XXX: BUILD_CLEAN handling should go in lib
ifdef BUILD_CLEAN
DO_BUILD_CLEAN = buildclean
export CCACHE_DISABLE=foo
else
DO_BUILD_CLEAN =
endif

PARALLELMFLAGS ?= $(MFLAGS)
export PARALLELMFLAGS

INSTALL_DIRS = $(addprefix $(DESTDIR),$(prefix) $(exec_prefix) $(ebindir) $(bindir) $(esbindir) $(sbindir) $(libexecdir) $(datadir) $(sysconfdir) $(sharedstatedir) $(localstatedir) $(elibdir) $(libdir) $(infodir) $(lispdir) $(includedir) $(oldincludedir) $(mandir) $(foreach NUM,1 2 3 4 5 6 7 8, $(mandir)/man$(NUM)) $(sourcedir))

# For rules that do nothing, display what dependencies they
# successfully completed
#DONADA = @echo "	[$@] complete.  Finished rules: $+"
DONADA = @touch $(COOKIEDIR)/$@; echo "	[$@] complete for $(GARNAME)."

# TODO: write a stub rule to print out the name of a rule when it
# *does* do something, and handle indentation intelligently.

# Default sequence for "all" is:  fetch checksum extract patch configure build
all: build
	$(DONADA)


include $(GARDIR)/gar.lib.mk
include $(GARDIR)/gar.bugs.mk

#################### DIRECTORY MAKERS ####################

# This is to make dirs as needed by the base rules
$(sort $(DOWNLOADDIR) $(PARTIALDIR) $(COOKIEDIR) $(WORKSRC) $(WORKDIR) $(EXTRACTDIR) $(FILEDIR) $(SCRATCHDIR) $(INSTALL_DIRS) $(GARCHIVEDIR) $(GARPKGDIR) $(STAGINGDIR)):
	@if test -d $@; then : ; else \
		install -d $@; \
		echo "install -d $@"; \
	fi

$(COOKIEDIR)/%:
	@if test -d $@; then : ; else \
		install -d $@; \
		echo "install -d $@"; \
	fi

# These stubs are wildcarded, so that the port maintainer can
# define something like "pre-configure" and it won't conflict,
# while the configure target can call "pre-configure" safely even
# if the port maintainer hasn't defined it.
# 
# in addition to the pre-<target> rules, the maintainer may wish
# to set a "pre-everything" rule, which runs before the first
# actual target.
pre-%:
	@true

post-%:
	@true

# Call any arbitrary rule recursively
deep-%: %
	@$(foreach IMG,$(IMGDEPS),for dep in $(filter-out $($(IMG)_NODEPEND),$($(IMG)_DEPENDS)); do $(MAKE) -C ../../$$dep DESTIMG=$(IMG) $@; done; )

# ========================= MAIN RULES ========================= 
# The main rules are the ones that the user can specify as a
# target on the "make" command-line.  Currently, they are:
#	fetch-list fetch checksum makesum extract checkpatch patch
#	build install reinstall uninstall package
# (some may not be complete yet).
#
# Each of these rules has dependencies that run in the following
# order:
# 	- run the previous main rule in the chain (e.g., install
# 	  depends on build)
#	- run the pre- rule for the target (e.g., configure would
#	  then run pre-configure)
#	- generate a set of files to depend on.  These are typically
#	  cookie files in $(COOKIEDIR), but in the case of fetch are
#	  actual downloaded files in $(DOWNLOADDIR)
# 	- run the post- rule for the target
# 
# The main rules also run the $(DONADA) code, which prints out
# what just happened when all the dependencies are finished.

announce:
	@echo "[===== NOW BUILDING:	$(DISTNAME)	=====]"

# fetch-list	- Show list of files that would be retrieved by fetch.
# NOTE: DOES NOT RUN pre-everything!
fetch-list:
	@echo "Distribution files: "
	@for i in $(DISTFILES); do echo "	$$i"; done
	@echo "Patch files: "
	@for i in $(PATCHFILES); do echo "	$$i"; done

# showdeps		- Show dependencies in a tree-structure
showdeps:
	@$(foreach IMG,$(IMGDEPS),for dep in $(filter-out $($(IMG)_NODEPEND),$($(IMG)_DEPENDS)); do echo -e "$(TABLEVEL)$(IMG): $$dep"; $(MAKE) -s -C $(GARDIR)/$$dep TABLEVEL="$(TABLEVEL)\t" DESTIMG=$(IMG) showdeps; done ;) true

# fetch			- Retrieves $(DISTFILES) (and $(PATCHFILES) if defined)
#				  into $(DOWNLOADDIR) as necessary.
FETCH_TARGETS =  $(addprefix $(DOWNLOADDIR)/,$(ALLFILES))

fetch: announce pre-everything $(COOKIEDIR) $(DOWNLOADDIR) $(PARTIALDIR) $(addprefix dep-$(GARDIR)/,$(FETCHDEPS)) pre-fetch $(FETCH_TARGETS) post-fetch 
	$(DONADA)

# returns true if fetch has completed successfully, false
# otherwise
fetch-p:
	@$(foreach COOKIEFILE,$(FETCH_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# checksum		- Use $(CHECKSUMFILE) to ensure that your
# 				  distfiles are valid.
CHECKSUM_TARGETS = $(addprefix checksum-,$(filter-out $(NOCHECKSUM),$(ALLFILES)))

checksum: fetch $(COOKIEDIR) pre-checksum $(CHECKSUM_TARGETS) post-checksum
	$(DONADA)

# returns true if checksum has completed successfully, false
# otherwise
checksum-p:
	@$(foreach COOKIEFILE,$(CHECKSUM_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# makesum		- Generate distinfo (only do this for your own ports!).
MAKESUM_TARGETS =  $(addprefix $(DOWNLOADDIR)/,$(filter-out $(NOCHECKSUM),$(ALLFILES))) 

makesum: fetch $(MAKESUM_TARGETS)
	@if test "x$(MAKESUM_TARGETS)" != "x "; then \
		md5sum $(MAKESUM_TARGETS) > $(CHECKSUM_FILE) ; \
		echo "Checksums made for $(MAKESUM_TARGETS)" ; \
		cat $(CHECKSUM_FILE) ; \
	fi

# I am always typing this by mistake
makesums: makesum

makesums-all: makesum
	@rm $(CHECKSUM_FILE)
	@$(foreach FILE,$(wildcard ./files/*), md5sum $(FILE) >> $(CHECKSUM_FILE) ; sed -i "s/\.\/files/download/g" $(CHECKSUM_FILE) ;)
	@md5sum $(addprefix $(DOWNLOADDIR)/,$(DISTFILES)) >> $(CHECKSUM_FILE)
	@echo "---- Full Checksums file:"
	@cat $(CHECKSUM_FILE)

GARCHIVE_TARGETS =  $(addprefix $(GARCHIVEDIR)/,$(ALLFILES))

garchive: checksum $(GARCHIVE_TARGETS) ;


# extract		- Unpacks $(DISTFILES) into $(EXTRACTDIR) (patches are "zcatted" into the patch program)
EXTRACT_TARGETS = $(addprefix extract-,$(filter-out $(NOEXTRACT),$(DISTFILES)))
EXTRACT_SOURCEPKG = $(addprefix $(COOKIEDIR)/sourcepkg-,$(addsuffix /patch,$(SOURCEPKG)))

extract: checksum $(EXTRACTDIR) $(COOKIEDIR) $(EXTRACT_SOURCEPKG) $(addprefix dep-$(GARDIR)/,$(EXTRACTDEPS)) pre-extract $(EXTRACT_TARGETS) post-extract
	$(DONADA)

# returns true if extract has completed successfully, false
# otherwise
extract-p:
	@$(foreach COOKIEFILE,$(EXTRACT_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# checkpatch	- Do a "patch -C" instead of a "patch".  Note
# 				  that it may give incorrect results if multiple
# 				  patches deal with the same file.
# TODO: actually write it!
checkpatch: extract
	@echo "$@ NOT IMPLEMENTED YET"

# patch			- Apply any provided patches to the source.
PATCH_TARGETS = $(addprefix patch-,$(PATCHFILES))

patch: extract $(WORKSRC) pre-patch $(PATCH_TARGETS) post-patch
	@find . -name '*.orig' -print -exec rm -rf {} \;
	$(DONADA)

# returns true if patch has completed successfully, false
# otherwise
patch-p:
	@$(foreach COOKIEFILE,$(PATCH_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# makepatch		- Grab the upstream source, patch it and diff against $(WORKSRC).  Since
# 				  diff returns 1 if there are differences, we remove the patch
# 				  file on "success".  Goofy diff.
makepatch: patch $(SCRATCHDIR) $(FILEDIR) $(FILEDIR)/gar-patched-base.diff
	@mv $(FILEDIR)/gar-patched-base.diff $(FILEDIR)/../current-changes.patch
	@sed 's|work/tmp/||g' -i $(FILEDIR)/../current-changes.patch
	@sed 's|work/main.d/||g' -i $(FILEDIR)/../current-changes.patch
	$(DONADA)

# makebasepatch		- Grab the upstream source and diff against $(WORKSRC).  Since
# 				  diff returns 1 if there are differences, we remove the patch
# 				  file on "success".  Goofy diff.
makebasepatch: patch $(SCRATCHDIR) $(FILEDIR) $(FILEDIR)/gar-base.diff
	@mv $(FILEDIR)/gar-base.diff $(FILEDIR)/../$(DISTNAME)-all-mm2-changes-in-one-patch.patch
	@sed 's|work/tmp/||g' -i $(FILEDIR)/../$(DISTNAME)-all-mm2-changes-in-one-patch.patch
	@sed 's|work/main.d/||g' -i $(FILEDIR)/../$(DISTNAME)-all-mm2-changes-in-one-patch.patch
	$(DONADA)

# this takes the changes you've made to a working directory,
# distills them to a patch, updates the checksum file, and tries
# out the build (assuming you've listed the gar-base.diff in your
# PATCHFILES).  This is way undocumented.  -NickM
beaujolais: makepatch makesum clean build
	$(DONADA)

# configure		- Runs either GNU configure, one or more local
# 				  configure scripts or nothing, depending on
# 				  what's available.
CONFIGURE_TARGETS = $(addprefix configure-,$(CONFIGURE_SCRIPTS))
CONFIGURE_IMGDEPS = $(addprefix imgdep-,$(IMGDEPS))

configure: patch $(CONFIGURE_IMGDEPS) $(addprefix srcdep-$(GARDIR)/,$(SOURCEDEPS)) pre-configure $(CONFIGURE_TARGETS) post-configure
	$(DONADA)

# returns true if configure has completed successfully, false
# otherwise
configure-p:
	@$(foreach COOKIEFILE,$(CONFIGURE_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# build			- Actually compile the sources.
BUILD_TARGETS = $(addprefix build-,$(BUILD_SCRIPTS))

build: configure pre-build $(BUILD_TARGETS) post-build
	$(DONADA)

# returns true if build has completed successfully, false
# otherwise
build-p:
	@$(foreach COOKIEFILE,$(BUILD_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# strip			- Strip binaries
strip: build pre-strip $(addprefix strip-,$(STRIP_SCRIPTS)) post-strip
	@echo "$@ NOT IMPLEMENTED YET"

# install		- Install the results of a build.
INSTALL_TARGETS = $(addprefix install-,$(INSTALL_SCRIPTS)) $(addprefix install-license-,$(subst /, ,$(LICENSE))) install-version

install: build $(addprefix dep-$(GARDIR)/,$(INSTALLDEPS)) $(INSTALL_DIRS) pre-install $(INSTALL_TARGETS) post-install $(DO_BUILD_CLEAN)
	$(DONADA)

# returns true if install has completed successfully, false
# otherwise
install-p:
	@$(foreach COOKIEFILE,$(INSTALL_TARGETS), test -e $(COOKIEDIR)/$(COOKIEFILE) ;)

# installstrip		- Install the results of a build, stripping first.
installstrip: strip pre-install $(INSTALL_TARGETS) post-install
	$(DONADA)

repatch:
	$(MAKE) clean
	$(MAKE) makesums
	$(MAKE) patch

# reconfigure		- Reconfigure ignoring
# 				  "already configured" flag.
reconfigure:
	@rm -rf $(COOKIEDIR)/imgdep-*
	@rm -rf $(COOKIEDIR)/pre-configure*
	@rm -rf $(COOKIEDIR)/configure*
	@rm -rf $(COOKIEDIR)/post-configure*
	$(MAKE) configure

# rebuild		- Rebuild ignoring
# 				  "already built" flag.
rebuild:
	@rm -rf $(COOKIEDIR)/build*
	$(MAKE) build

# reinstall		- Install the results of a build, ignoring
# 				  "already installed" flag.
reinstall: build
	rm -rf $(COOKIEDIR)/pre-install*
	rm -rf $(COOKIEDIR)/install*
	rm -rf $(COOKIEDIR)/post-install*
	$(MAKE) install

# uninstall		- Remove the installation.
# TODO: actually write it!
uninstall: build
	@echo "$@ NOT IMPLEMENTED YET"
	

# package		- Create a package from an _installed_ port.
# TODO: actually write it!
package: build
	@echo "$@ NOT IMPLEMENTED YET"

# tarball		- Make a tarball from an install of the package into a scratch dir
tarball: tarball-$(DESTIMG)

tarball-%:
	$(MAKE) DESTIMG="$*" install
	$(MAKE) DESTIMG="$*" $*_DESTDIR="$(CURDIR)/$(SCRATCHDIR)" reinstall
	find $(SCRATCHDIR) -depth -type d | while read i; do rmdir $$i > /dev/null 2>&1 || true; done
	tar czvf $(CURDIR)/$(WORKDIR)/$(DISTNAME)-$*-install.tar.gz -C $(SCRATCHDIR) .
	$(MAKECOOKIE)

# garpkg		- Produce a garpkg and file it appropriately under $(GARPKGDIR)
garpkg: $(GARPKGDIR)
	$(MAKE) DESTIMG="$(DESTIMG)" $(DESTIMG)_prefix="/usr/local" tarball
	install -m 644 -D $(CURDIR)/$(WORKDIR)/$(DISTNAME)-$(DESTIMG)-install.tar.gz $(GARPKGDIR)/$(DISTNAME).tar.gz
	ln -fs $(DISTNAME).tar.gz $(GARPKGDIR)/$(GARNAME).tar.gz
	rm -f $(GARPKGDIR)/$(GARNAME).tar.gz.sig
	gpg --detach-sign $(GARPKGDIR)/$(GARNAME).tar.gz
	mv $(GARPKGDIR)/$(GARNAME).tar.gz.sig $(GARPKGDIR)/$(DISTNAME).tar.gz.sig	
	ln -fs $(DISTNAME).tar.gz.sig $(GARPKGDIR)/$(GARNAME).tar.gz.sig
	$(MAKECOOKIE)
	

# The clean rule.  It must be run if you want to re-download a
# file after a successful checksum (or just remove the checksum
# cookie, but that would be lame and unportable).
clean: $(if $(strip $(CLEAN_SCRIPTS)),$(addprefix clean-,$(CLEAN_SCRIPTS)),downloadclean cookieclean)

downloadclean:
	@rm -rf $(DOWNLOADDIR)

cookieclean: buildclean
	@rm -rf $(COOKIEROOTDIR)
	@rm -rf tmp-$(COOKIEROOTDIR)

buildclean:
	@rm -rf $(WORKSRC) $(WORKROOTDIR) $(EXTRACTDIR) $(SCRATCHDIR) $(SCRATCHDIR)-$(COOKIEDIR) $(SCRATCHDIR)-build *~

imgclean:
	rm -rf $(DESTDIR)$(prefix)

superclean: clean imgclean

love:
	@echo "not war!"

# these targets do not have actual corresponding files
.PHONY: all fetch-list beaujolais fetch-p checksum-p extract-p patch-p configure-p build-p install-p love

# apparently this makes all previous rules non-parallelizable,
# but the actual builds of the packages will be, according to
# jdub.
.NOTPARALLEL:
