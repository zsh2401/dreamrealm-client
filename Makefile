.PHONY=all

SHARED=__platform/shared
WIN32=__platform/win32
UNIX=__platform/unix
ROOT = $(shell pwd)
clean:
	rm -rf bin *.tar.gz *.zip
	rm -rf DreamRealm-*
	make -C $(SHARED)/.minecraft clean

__shared:
	mkdir bin
	cp -r $(SHARED)/* bin/
	cp -r $(SHARED)/.minecraft bin/

win32: clean __shared 
	cp -r $(WIN32)/* bin/

unix: clean __shared
	cp -r $(UNIX)/* bin/

pwin32: win32
	mv bin DreamRealm-$(VERSION_NAME)
	zip -r DreamRealm-$(VERSION_NAME).zip DreamRealm-$(VERSION_NAME)
	rm -rf DreamRealm-$(VERSION_NAME	)

punix: unix
	mv bin DreamRealm-$(VERSION_NAME)
	tar -cvf DreamRealm-$(VERSION_NAME).tar.gz DreamRealm-$(VERSION_NAME)
	rm -rf DreamRealm-$(VERSION_NAME)

pack:
	ROOT
	read -p "aa" SHELL_VNAME
	@echo ${SHELL_VNAME}