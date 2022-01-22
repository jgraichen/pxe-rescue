# PXE rescue

Debian 11 image with ZFS modules preinstalled, build as squashfs image for PXE boot.

## Usage

### Install dependencies

```
apt install bdebstrap squashfs-tools-ng
```

### Build image

```
bdebstrap -c rescue.yml --force
```

## Configuration

### iPXE menu

```
initrd http://.../rescue/initrd.img
chain http://.../rescue/vmlinuz initrd=initrd.img boot=live config components autologin username=root noeject fetch=http://.../rescue/root.squashfs
```
