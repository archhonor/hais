#! /bin/sh
arch-chroot /mnt pacman -S catalyst-dkms catalyst-utils opencl-catalyst lib32-catalyst-utils opencl-headers
./startmenu.sh
