
GARNAME      = gn
# main  @1.05.2026
GARVERSION   = 9ece3f5254c273cb46606a6571963f931c3b012d
CATEGORIES   = devel
MASTER_SITES = https://gn.googlesource.com/gn/+archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = 01-fix-compiling.patch
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
	@touch $(WORKSRC)/src/gn/last_commit_position.h
	@echo "#define LAST_COMMIT_POSITION_NUM 01052026"       >> $(WORKSRC)/src/gn/last_commit_position.h
	@echo "#define LAST_COMMIT_POSITION \"g$(GARVERSION)\"" >> $(WORKSRC)/src/gn/last_commit_position.h
	@cd $(WORKSRC) ; python3 ./build/gen.py --no-last-commit-position
	@$(MAKECOOKIE)

build-custom:
	@cd $(WORKSRC) ; ninja -C out
	@$(MAKECOOKIE)

install-custom:
	@cp $(WORKSRC)/out/gn $(DESTDIR)$(bindir)/gn
	@$(MAKECOOKIE)
