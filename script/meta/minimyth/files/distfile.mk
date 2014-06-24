GARNAME    ?= minimyth
GARVERSION ?= $(mm_VERSION)

all: mm-all

include ../../gar.mk

# $1 = file/directory
SET_PERMISSIONS = \
	chmod -R -s   $(strip $(1))                                                   ; \
	chmod -R -t   $(strip $(1))                                                   ; \
	chmod -R +r   $(strip $(1))                                                   ; \
	chmod -R u+w  $(strip $(1))                                                   ; \
	chmod -R go-w $(strip $(1))                                                   ; \
	find          $(strip $(1)) -depth -type d             -exec chmod +x '{}' \; ; \
	find          $(strip $(1)) -depth -type f -perm /0100 -exec chmod +x '{}' \;

mm-all: $(DOWNLOADDIR)/$(DISTNAME).tar.bz2

$(PARTIALDIR)/$(DISTNAME):
	@echo 'creating $(DISTNAME)'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@touch $@~
	@mv $@~ $@

$(PARTIALDIR)/$(DISTNAME)/Makefile: files/Makefile | $(PARTIALDIR)/$(DISTNAME)
	@echo 'adding $(DISTNAME)/Makefile'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@chmod 0644 $@~
	@touch $@~
	@mv $@~ $@

$(PARTIALDIR)/$(DISTNAME)/source: files/source | $(PARTIALDIR)/$(DISTNAME)
	@echo 'adding $(DISTNAME)/source'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@$(call SET_PERMISSIONS,$@~)
	@find $@~ -depth -name .svn -exec rm -rf '{}' \;
	@touch $@~
	@mv $@~ $@

$(PARTIALDIR)/$(DISTNAME)/source/lists/extras: \
		$(wildcard $(GARDIR)/extras/extras-bin-list)   \
		$(wildcard $(GARDIR)/extras/extras-etc-list)   \
		$(wildcard $(GARDIR)/extras/extras-lib-list)   \
		$(wildcard $(GARDIR)/extras/extras-share-list) \
		| \
		$(PARTIALDIR)/$(DISTNAME)/source
	@echo 'adding $(DISTNAME)/source/lists/extras'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@mkdir -m 0755 -p $@~
	@cp -pdR $^ $@~
	@$(call SET_PERMISSIONS,$@~)
	@find $@~ -name .svn -exec rm -rf '{}' +
	@touch $@~
	@mv $@~ $@

$(PARTIALDIR)/$(DISTNAME)/source/html: $(GARDIR)/../html/minimyth | $(PARTIALDIR)/$(DISTNAME)/source
	@echo 'adding $(DISTNAME)/source/html'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@cp -pdR $< $@~
	@$(call SET_PERMISSIONS,$@~)
	@find $@~ -name .svn      -exec rm -rf '{}' +
	@find $@~ -name .htaccess -exec rm -rf '{}' +
	@touch $@~
	@mv $@~ $@

$(PARTIALDIR)/$(DISTNAME)/source/gar-minimyth: $(abspath $(GARDIR)/..) | $(PARTIALDIR)/$(DISTNAME)/source
	@echo 'adding $(DISTNAME)/source/gar-minimyth'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@rm -rf $@~~
	@mkdir -m 0755 -p $@~~
	@tar  -C $(<D) \
		--exclude '$(<F)/images/*' \
		--exclude '$(<F)/source/*' \
		--exclude '$(<F)/script/*/*/cookies' \
		--exclude '$(<F)/script/*/*/cookies/*' \
		--exclude '$(<F)/script/*/*/download' \
		--exclude '$(<F)/script/*/*/download/*' \
		--exclude '$(<F)/script/*/*/tmp' \
		--exclude '$(<F)/script/*/*/tmp/*' \
		--exclude '$(<F)/script/*/*/work' \
		--exclude '$(<F)/script/*/*/work/*' \
		--exclude '$(<F)/*.log' \
		--exclude '$(<F)/script/*.log' \
		--exclude '$(<F)/script/*/*.log' \
		--exclude '$(<F)/script/*/*/*.log' \
		-jcf $@~~/$(<F).tar.bz2 \
		$(<F)
	@cd $@~~ ; tar -jxf $(<F).tar.bz2
	@mv $@~~/$(<F) $@~
	@rm -rf $@~~
	@$(call SET_PERMISSIONS,$@~)
	@find $@~ -name .svn -exec rm -rf '{}' +
	@touch $@~
	@mv $@~ $@

$(DOWNLOADDIR)/$(DISTNAME).tar.bz2: \
		$(PARTIALDIR)/$(DISTNAME) \
		$(PARTIALDIR)/$(DISTNAME)/Makefile \
		$(PARTIALDIR)/$(DISTNAME)/source \
		$(PARTIALDIR)/$(DISTNAME)/source/lists/extras \
		$(PARTIALDIR)/$(DISTNAME)/source/html \
		$(PARTIALDIR)/$(DISTNAME)/source/gar-minimyth
	@echo 'creating $(DISTNAME).tar.bz2'
	@mkdir -m 0755 -p $(@D)
	@rm -rf $@ $@~
	@tar -C $(<D) -jcf $@~ $(<F)
	@rm -rf $<
	@touch $@~
	@mv $@~ $@

.PHONY: all mm-all
