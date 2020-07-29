.PHONY=clean

VERSION=`cat VersionName.txt`
UNIX_FLODER=DreamRealm-$(VERSION)U
FLODER=DreamRealm-$(VERSION)
UNIX_PACK=DreamRealm-$(VERSION).tar.gz
WIN_PACK=DreamRealm-$(VERSION).zip

launchercfg:
	cp src/NsisoLauncher/Config/MainConfig.dev.json src/NsisoLauncher/Config/MainConfig.json

pack: pack_win32 pack_unix

pack_win32: clean launchercfg
	@mkdir $(FLODER)
	@cp -r src/{开始游戏.exe,*.url,.minecraft,NsisoLauncher} $(FLODER)
	@zip -r $(WIN_PACK) $(FLODER)
	@rm -r $(FLODER)
	
pack_unix: clean
	@mkdir $(UNIX_FLODER)
	@cp -r src/{HMCL.jar,*.url,*.sh,.minecraft} $(UNIX_FLODER)
	@tar -czvf $(UNIX_PACK) $(UNIX_FLODER)
	@rm -r $(UNIX_FLODER)

cleansrc:
	@make -C ./src/.minecraft clean
	@rm -f src/.hmcl*.json

cleanbuild:
	@rm -rf DreamRealm-*

clean: cleansrc cleanbuild


