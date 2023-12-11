
GARNAME       = readline
GARVERSION    = 8.2
CATEGORIES    = lib
MASTER_SITES  = https://ftp.gnu.org/gnu/$(GARNAME)/
MASTER_SITES += https://ftp.gnu.org/gnu/$(GARNAME)/$(DISTNAME)-patches/
DISTFILES     = $(DISTNAME).tar.gz
PATCHFILES    = \
	$(GARNAME)$(subst .,,$(GARVERSION))-001 \
	$(GARNAME)$(subst .,,$(GARVERSION))-002 \
	$(GARNAME)$(subst .,,$(GARVERSION))-003 \
	$(GARNAME)$(subst .,,$(GARVERSION))-004 \
	$(GARNAME)$(subst .,,$(GARVERSION))-005 \
	$(GARNAME)$(subst .,,$(GARVERSION))-006 \
	$(GARNAME)$(subst .,,$(GARVERSION))-007 \
	$(DISTNAME)-add-ncurses-linking.patch

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c lib/ncurses

PATCHDIRLEVEL = 0

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) \
	--enable-shared \
	--disable-static \
	--with-curses \

include ../../gar.mk

patch-%: normal-patch-%
	@$(MAKECOOKIE)

pre-configure:
	@#$(call RUN_AUTOTOOLS)
	@$(call FIX_LIBTOOL,$(WORKSRC)/configure)
	@$(call FIX_LIBTOOL,$(WORKSRC)/support/config.rpath)
	@rm -f $(WORKSRC)/config.cache
	@#echo "bash_cv_have_mbstate_t=yes" >> $(WORKSRC)/config.cache
	@$(MAKECOOKIE)
