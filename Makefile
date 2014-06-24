include script/gar.conf.mk

build:
	@echo "error: 'make build' must be run in directory 'script/meta/minimyth'."
	@exit 1

clean:
	@rm -rf images/*
	@make -C script clean

clean-main:
	@rm -rf images/main
	@make -C script DESTIMG=main clean-image

garchive:
	@make -C script garchive

install:
	@echo "error: 'make install' must be run in directory 'script/meta/minimyth'."
	@exit 1

update-gar:
	@cd devel ; ./update-gar
