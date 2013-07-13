#! /bin/sh
arch-chroot /mnt pacman -S lxdm
arch-chroot /mnt systemctl enable lxdm.service
