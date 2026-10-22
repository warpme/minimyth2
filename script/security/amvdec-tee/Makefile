
GARNAME      = amvdec-tee
GARVERSION   = 1d7e8009cce1692fef04a729e859e8602b8eec9e
CATEGORIES   = security
MASTER_SITES = https://github.com/LibreELEC/amvdec-tee/archive/
DISTFILES    = $(GARVERSION).tar.gz
PATCHFILES   = 0001-minimyth2-ehnacements.patch \
               0002-fix-TEE_ERROR_SIGNATURE_INVALID-on-A95X-F3-Air-II.patch \

LICENSE      = GPL

DEPENDS = lang/c security/optee_client

BUILD_SCRIPTS   = $(WORKSRC)/Makefile
INSTALL_SCRIPTS = $(WORKSRC)/Makefile

BUILD_ARGS   = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)" \
    CPPFLAGS="$(CPPFLAGS)" \
    CFLAGS="$(CFLAGS) $(LDFLAGS)" \
    CXXFLAGS="$(CXXFLAGS) $(LDFLAGS)"
INSTALL_ARGS = \
    DESTDIR="$(DESTDIR)" \
    PREFIX="$(prefix)" \
    LIBDIR="$(libdir)"

include ../../gar.mk
