.PHONY=clean
VERSION=2.0
launchercfg:
	cp src/NsisoLauncher/Config/MainConfig.dev.json src/NsisoLauncher/Config/MainConfig.json
pack: clean launchercfg
	@mkdir DreamRealm-$(VERSION)
	@cp -r src/* DreamRealm-$(VERSION)/
	@cp -r src/.minecraft DreamRealm-$(VERSION)/
	zip -r DreamRealm-$(VERSION).zip DreamRealm-$(VERSION) -x 'src/HMCL.jar src/play-on-unix.sh src/.gitignore src/.minecraft/saves' .
cleani:
	@rm -rf DreamRealm-$(VERSION)
cleanuseless:
	@make -C ./src/.minecraft clean
clean: cleanuseless cleani
	@rm -f DreamRealm-$(VERSION).zip
