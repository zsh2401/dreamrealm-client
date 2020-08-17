.PHONY=all

SHARED=__platform/shared
WIN32=__platform/win32
UNIX=__platform/unix

clean:
	rm -rf bin/*
	rm -rf bin/.minecraft
	make -C $(SHARED)/.minecraft clean

__shared:
	find bin
	cp -r $(SHARED)/* bin/
	cp -r $(SHARED)/.minecraft bin/

win32: clean __shared 
	cp -r $(WIN32)/* bin/

unix: clean __shared
	cp -r $(UNIX)/* bin/
