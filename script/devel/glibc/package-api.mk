# release/2.38/master at 22.10.2024
GLIBC_VERSION = 20240122-cfe12191

GLIBC_ADD_LIB_PATH = \
	mkdir -p $(DESTDIR)$(sysconfdir) ; \
	$(if $(shell test -e $(DESTDIR)$(sysconfdir)/ld.so.conf && grep -e '$(strip $(1))' $(DESTDIR)$(sysconfdir)/ld.so.conf),, \
		echo '$(strip $(1))' >> $(DESTDIR)$(sysconfdir)/ld.so.conf ; \
		test ! -e $(build_DESTDIR)/$(build_esbindir)/ldconfig || $(build_DESTDIR)/$(build_esbindir)/ldconfig )
