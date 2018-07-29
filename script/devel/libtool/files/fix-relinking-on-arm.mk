
post-configure:
ifeq ($(DESTIMG),main)
ifeq ($(GARCH_FAMILY),arm)
	@echo "Fixing libtool relinking on ARM platform"
	@sed -e "s%^libdir='.*%libdir='$(main_DESTDIR)$(main_libdir)'\"%" -i $(WORKSRC)/libtool
endif
endif
	@$(MAKECOOKIE)
