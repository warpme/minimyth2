
# release 2.40/master at 08.09.2024
GLIBC_VERSION = 20240908-3414b17e

GLIBC_ADD_LIB_PATH = \
	mkdir -p $(DESTDIR)$(sysconfdir) ; \
	$(if $(shell test -e $(DESTDIR)$(sysconfdir)/ld.so.conf && grep -e '$(strip $(1))' $(DESTDIR)$(sysconfdir)/ld.so.conf),, \
		echo '$(strip $(1))' >> $(DESTDIR)$(sysconfdir)/ld.so.conf ; \
		test ! -e $(build_DESTDIR)/$(build_esbindir)/ldconfig || $(build_DESTDIR)/$(build_esbindir)/ldconfig )
