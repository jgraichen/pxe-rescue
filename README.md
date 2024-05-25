# PXE rescue

PXE-bootable rescue images with ZFS and useful tools preinstalled.

* Debian 12 bookworm
* Ubuntu 24.04 noble

## Usage

### Install dependencies

```console
apt install bdebstrap squashfs-tools-ng
```

### Build image

```console
bdebstrap -c rescue-debian.yml --force
```

## Configuration

### iPXE menu

```ipxe
initrd http://.../rescue/initrd.img
chain http://.../rescue/vmlinuz initrd=initrd.img boot=live config components autologin username=root noeject fetch=http://.../rescue-debian/root.squashfs
```

### cloud-init data source

<https://cloudinit.readthedocs.io/en/latest/reference/datasources/nocloud.html#datasource-nocloud>
