#!/usr/bin/env make -f

build/rescue/root.squashfs: rescue.yml
	bdebstrap -c $< --force

clean:
	rm -r build
