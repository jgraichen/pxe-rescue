#!/usr/bin/env make -f

RSYNC = rsync -rvh --info=progress2

build/rescue-debian/root.squashfs: rescue-debian.yml
	bdebstrap -c $< --force

build/rescue-ubuntu/root.squashfs: rescue-ubuntu.yml
	bdebstrap -c $< --force

all: build/rescue-debian/root.squashfs build/rescue-ubuntu/root.squashfs

clean:
	rm -r build

.PHONY: push
push: build/rescue-debian/root.squashfs
ifndef TARGET
	$(error TARGET is not set)
endif
	$(RSYNC) "$(shell dirname "$<")/" "$(TARGET)"
