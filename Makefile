include script/gar.conf.mk

build:
	@echo "error: 'make build' must be run in directory 'script/meta/minimyth'."
	@exit 1

clean:
	@rm -rf images/*
	@make -C script clean

clean-main:
	@make -C script              DESTIMG=main  clean-image
	@make -C script/devel/meson  DESTIMG=build reinstall
	@rm -rf images/main
	@rm -rf images/build/usr/*-minimyth-linux-gnu*
	@rm -rf images/build/usr/bin/*-minimyth-linux-gnu*
	@rm -rf images/build/usr/lib/gcc/*-minimyth-linux-gnu*
	@rm -rf images/build/usr/libexec/gcc/*-minimyth-linux-gnu*
	@find . -name build_main.d -exec rm -rf {} \;

garchive:
	@make -C script garchive

install:
	@echo "error: 'make install' must be run in directory 'script/meta/minimyth'."
	@exit 1

update-gar:
	@cd devel ; ./update-gar
