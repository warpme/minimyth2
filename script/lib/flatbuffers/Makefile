
GARNAME      = flatbuffers
GARVERSION   = 23.5.9
CATEGORIES   = lib
MASTER_SITES = https://github.com/google/flatbuffers/archive/v$(GARVERSION)/
DISTFILES    = $(DISTNAME).tar.gz
LICENSE      = GPL

DEPENDS = lang/c

WORKBLD = $(WORKSRC)_build

CONFIGURE_SCRIPTS = $(WORKBLD)/cmake
BUILD_SCRIPTS     = $(WORKBLD)/Makefile
INSTALL_SCRIPTS   = $(WORKBLD)/Makefile

CMAKE_CONFIGURE_ARGS = \
	-DCMAKE_VERBOSE_MAKEFILE="OFF" \
	-DCMAKE_BUILD_TYPE=Release \
	-DFLATBUFFERS_CODE_COVERAGE=OFF \
	-DFLATBUFFERS_BUILD_TESTS=OFF \
	-DFLATBUFFERS_INSTALL=ON \
	-DFLATBUFFERS_BUILD_FLATLIB=OFF \
	-DFLATBUFFERS_BUILD_FLATC=ON \
	-DFLATBUFFERS_BUILD_FLATHASH=OFF \
	-DFLATBUFFERS_BUILD_GRPCTEST=OFF \
	-DFLATBUFFERS_BUILD_SHAREDLIB=OFF \

include ../../gar.mk

post-install:
ifneq ($(DESTIMG),build)
	@# hack for kodi not using native flatc
	@mv $(DESTDIR)$(bindir)/flatc /$(DESTDIR)$(bindir)/flatc.main
	@cp -f $(build_DESTDIR)$(build_bindir)/flatc $(DESTDIR)$(bindir)/flatc
endif
	@$(MAKECOOKIE)
