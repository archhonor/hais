#! /bin/sh
arch-chroot /mnt pacman -S xf86-video-nouveau nouveau-dri
./startmenu.sh
