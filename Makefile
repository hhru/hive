build:
	ant package

clean:
	rm -rfv build

install:
	umask 0222
	mkdir -p debian/hive/usr/lib/hive/bin
	mkdir -p debian/hive/usr/lib/hive/lib
	cp -Rv build/dist/bin/* debian/hive/usr/lib/hive/bin
	cp -Rv build/dist/lib/* debian/hive/usr/lib/hive/lib
	#cp -Rv build/dist/etc/hive debian/hive/etc/
	ln -s /etc/hive/conf debian/hive/usr/lib/hive/conf
	mkdir -p debian/hive/usr/bin
	install -D exec/hive debian/hive/usr/bin/
	cp -Rv build/dist/scripts debian/hive/usr/lib/hive/
