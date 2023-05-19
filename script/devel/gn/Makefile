
GARNAME      = gn
GARVERSION   = 5a004f9427a050c6c393c07ddb85cba8ff3849fa
CATEGORIES   = devel
MASTER_SITES = https://gn.googlesource.com/gn/+archive/
DISTFILES    = $(GARVERSION).tar.gz last_commit_position.h
PATCHFILES   = fix-gcc13-compile.patch
LICENSE      = BSD_3_Clause

DESCRIPTION = 
define BLURB
endef

WORKSRC = $(WORKDIR)

DEPENDS = python3/python

CONFIGURE_SCRIPTS = custom
BUILD_SCRIPTS     = custom
INSTALL_SCRIPTS   = custom

include ../../gar.mk

export CC = $(build_CC)
export CXX = $(build_CXX)
export AR = $(build_AR)

configure-custom:
	@# dealing with gn bug where gn still looks for last_commit_position.h despite --no-last-commit-position param
	@cp $(WORKSRC)/last_commit_position.h $(WORKSRC)/src/gn/last_commit_position.h
	@cd $(WORKSRC) ; python3 ./build/gen.py --no-last-commit-position
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) ; ninja -C out
	@$(MAKECOOKIE)

install-custom:
	@cp $(WORKSRC)/out/gn $(DESTDIR)$(bindir)/gn
	@$(MAKECOOKIE)
