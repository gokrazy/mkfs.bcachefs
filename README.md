# gokrazy mkfs.bcachefs

This program is intended to be run on gokrazy only, where it will create an
bcachefs file system on the perm partition and then reboot your system. If
`/perm` is already mounted, the program will exit without changing anything.

The gokrazy mkfs program includes a [frozen
copy](https://github.com/gokrazy/freeze) of
[`bcachefs-tools`](https://github.com/koverstreet/bcachefs-tools) 

## Usage

You can either add this program to your gokrazy instance:

```
gok add github.com/gokrazy/mkfs.bcachefs
```

…or, if you want to run it only once without otherwise including it in your
installation, you can use `gok run`:

```
git clone https://github.com/gokrazy/mkfs.bcachefs
cd mkfs.bcachefs
gok -i bakery run
```

## Building
Install `podman` as well as `qemu-user-static-binfmt` or `qemu-user-static`.
Bcachefs-tools are built via emulation instead of cross compilation currently.
Then:
`make
clean && make all`

