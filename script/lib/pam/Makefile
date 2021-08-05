
GARNAME      = Linux-PAM
GARVERSION   = 1.5.1
CATEGORIES   = lib
MASTER_SITES = https://github.com/linux-pam/linux-pam/releases/download/v$(GARVERSION)/
DISTFILES    = $(GARNAME)-$(GARVERSION).tar.xz
LICENSE      = LGPL2

DESCRIPTION = 
define BLURB
endef

DEPENDS = lang/c devel/flex devel/libtirpc

CONFIGURE_SCRIPTS = $(WORKSRC)/configure
BUILD_SCRIPTS     = $(WORKSRC)/Makefile
INSTALL_SCRIPTS   = $(WORKSRC)/Makefile

CONFIGURE_ARGS = $(DIRPATHS) --build=$(GARBUILD) --host=$(GARHOST) --disable-db

include ../../gar.mk

post-install:
	@cp -rf $(WORKSRC)/libpam/include/security $(DESTDIR)$(includedir)/
	@ln -srf $(DESTDIR)$(includedir)/pam_misc.h $(DESTDIR)$(includedir)/security/pam_misc.h
	@ln -srf $(DESTDIR)$(includedir)/pam_client.h $(DESTDIR)$(includedir)/security/pam_client.h
	@rm -f $(DESTDIR)$(libdir)/libpam.la
	@rm -f $(DESTDIR)$(libdir)/libpamc.la
	@rm -f $(DESTDIR)$(libdir)/libpam_misc.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_nologin.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_pwhistory.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_tally.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_rootok.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_mkhomedir.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_faildelay.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_limits.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_localuser.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_deny.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_tally2.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_issue.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_time.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_lastlog.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_rhosts.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_keyinit.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_permit.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_group.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_umask.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_env.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_listfile.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_succeed_if.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_wheel.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_loginuid.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_unix.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_filter.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_access.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_warn.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_mail.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_timestamp.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_exec.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_namespace.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_shells.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_xauth.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_stress.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_ftp.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_debug.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_securetty.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_motd.la
	@rm -f $(DESTDIR)$(libdir)/security/pam_echo.la
	@$(MAKECOOKIE)
