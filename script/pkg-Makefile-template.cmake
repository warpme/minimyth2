
# This is Makefile template for building package which uses cmake.
# If package is fairly standard one - all what is needed is to put correct data in fields with <...>
# good example of such package: script/emulators/VisualBoyAdvance

GARNAME      = <name of package>
GARVERSION   = <version of package>
CATEGORIES   = <category: lib, utils, system, ...>
MASTER_SITES = <url with source archive with stripped filename.extenssion and ended with slash>
DISTFILES    = <$(DISTNAME).tar.bz2[tar|tar.gz|lz|xz|zip|deb]>
# DISTFILES    = <file.extenssion to download from $(MASTER_SITES). Set this if file is not $(GARNAME)-$(GARVERSION)).tar.bz2[tar|tar.gz|lz|xz|zip|deb]
WORKSRC      = <dir name when sources have internal dir different than $(GARNAME)-$(GARVERSION). Use: $(WORKDIR)/<dir with sources>>
LICENSE      = <licence file. Can be: GPL, GPL2, BSD, MIT, etc. Or add the URL to any custom license>
# adding custom license file:
# assuming license is file 'LIC' in sources root dir
# LICENSE = $(GARNAME)
# $(GARNAME)_LICENSE_TEXT = $(WORKSRC)/LIC

DESCRIPTION = <package desctiption>
define BLURB
 Enter a longer description here.

 You can use multiple lines if you want.
endef

DEPENDS = <list of cross-compiled dependency packages required for package build & runtime like i.e.: lang/c lib/slang>

BUILDDEPS = <list of packages built for build machine target required to build package i.e. required execution of some 
package binaries for target package building>

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CONFIGURE_ARGS = $(DIRPATHS_CMAKE) \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \

include ../../gar.mk

#pre-configure:
# Actions executed in $(WORKSRC) after unpacking & patching sources before running cofigure
#	@$(MAKECOOKIE)

#post-configure:
# Actions executed after successful configure before starting build
# i.e. @# hack to fix failed build due double pipe in nm commnds
#	@sed -e 's%| \\$$global_symbol_pipe%\\$$global_symbol_pipe%g' -i $(WORKSRC)/libtool
# If You want to distinguish actions for 'build' target from actions for cross-compile target
# use conditional below:
#ifneq ($(DESTIMG),build)
# actions for cross-compile target
#else
# actions for build target
#endif
#	@$(MAKECOOKIE)

#pre-install:
# Actions executed after successful make before running install.
#	i.e. @sed -i -e "s/mcookie=.*/mcookie=\`\/\/usr\/bin\/mcookie\`/" $(WORKSRC)/startx
#	@$(MAKECOOKIE)

#post-install:
# Actions executed after successful install (i.e. cleanup; delete uneeded installed files...)
# Note: as GAR _requires_ removing of linker archive (*.la) files - always fill this rule to
# delete ALL installed *.la files!
#	i.e. @rm -f $(DESTDIR)$(libdir)/<file>.la
#	@$(MAKECOOKIE)

#clean-all: clean
# Actions executed when user calls 'make clean-all'. Usually used to delele ALL installed 
# packge files
#	i.e. @rm -f $(DESTDIR)$(libdir)/$(GARNAME).la
#	i.e. @rm -f $(DESTDIR)$(libdir)/pkgconfig/$(GARNAME).pc
#	i.e. @rm -f $(DESTDIR)$(bindir)/$(GARNAME)
