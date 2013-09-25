build:
	JAVA_HOME=/usr/lib/jvm/java-6-oracle ant package

clean:
	ant very-clean
	rm -rfv build

install:
	umask 0222
	mkdir -p debian/hive/usr/lib/hive/bin
	mkdir -p debian/hive/usr/lib/hive/lib
	mkdir -p debian/hive/etc/hive/conf
	cp -Rv build/dist/bin/* debian/hive/usr/lib/hive/bin
	cp -Rv build/dist/lib/* debian/hive/usr/lib/hive/lib
	cp -Rv build/dist/conf/hive-default.xml.template debian/hive/etc/hive/conf/hive-site.xml
	ln -s /etc/hive/conf debian/hive/usr/lib/hive/conf
	mkdir -p debian/hive/usr/bin
	install -D exec/hive debian/hive/usr/bin/
	cp -Rv build/dist/scripts debian/hive/usr/lib/hive/
