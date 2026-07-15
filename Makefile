#!/usr/bin/env make -f

RSYNC = rsync -rvh --info=progress2

build/rescue-debian/root.squashfs: rescue-debian.yml
	bdebstrap -c $< --force

build/rescue-ubuntu/root.squashfs: rescue-ubuntu.yml
	bdebstrap -c $< --force

all: build/rescue-debian/root.squashfs build/rescue-ubuntu/root.squashfs

build/rescue-%.iso: build/rescue-%/root.squashfs config/grub.cfg
	rm -rf $@.d
	mkdir -p $@.d/live $@.d/boot/grub
	cp build/rescue-$*/vmlinuz build/rescue-$*/initrd.img $@.d/live/
	cp $< $@.d/live/filesystem.squashfs
	cp config/grub.cfg $@.d/boot/grub/grub.cfg
	grub-mkrescue -o $@ $@.d
	rm -rf $@.d

.PHONY: iso
iso: build/rescue-debian.iso build/rescue-ubuntu.iso

clean:
	rm -r build

.PHONY: push
push: build/rescue-debian/root.squashfs
ifndef TARGET
	$(error TARGET is not set)
endif
	$(RSYNC) "$(shell dirname "$<")/" "$(TARGET)"
