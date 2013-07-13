#! /bin/sh
arch-chroot /mnt pacman -S nvidia nvidia-utils lib32-nvidia-utils libcl opencl-nvidia opencl-headers
arch-chroot /mnt nvidia-xconfig
./startmenu.sh
