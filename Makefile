#!/usr/bin/env make -f

build/rescue-debian/root.squashfs: rescue-debian.yml
	bdebstrap -c $< --force

build/rescue-ubuntu/root.squashfs: rescue-ubuntu.yml
	bdebstrap -c $< --force

all: build/rescue-debian/root.squashfs build/rescue-ubuntu/root.squashfs

clean:
	rm -r build
