# .PHONY : clean cleanu win32 unix pwin32 punix __shared

SHARED=__platform/shared
WIN32=__platform/win32
UNIX=__platform/unix
VERSION_NAME=`cat VersionName.txt`

default: pack

.PHONY : clean 
clean: cleanu cleani
	rm -rf *.tar.gz *.zip

.PHONY : cleanu 
cleanu: 
	make -C $(SHARED)/.minecraft clean

.PHONY : cleanu 	
cleani:
	rm -rf bin DreamRealm-$(VERSION_NAME)

.PHONY : shared 
shared: cleanu cleani
	./initdir.sh
	cp -r $(SHARED)/* bin/
	cp -r $(SHARED)/.minecraft bin/

.PHONY : win32 
win32: shared 
	cp -r $(WIN32)/*  bin/
	cp -r $(WIN32)/.minecraft bin/

.PHONY : unix 
unix: shared
	cp -r $(UNIX)/* bin/
	# cp -r $(UNIX)/.minecraft bin/

.PHONY : pwin32 
pwin32: win32
	mv bin DreamRealm-$(VERSION_NAME)
	zip -rq DreamRealm-$(VERSION_NAME).zip DreamRealm-$(VERSION_NAME)
	make cleani
	
.PHONY : punix 
punix: unix
	mv bin DreamRealm-$(VERSION_NAME)
	tar -czf DreamRealm-$(VERSION_NAME).tar.gz DreamRealm-$(VERSION_NAME)
	make cleani

pack:
	make pwin32
	make punix
