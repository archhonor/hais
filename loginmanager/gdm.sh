#! /bin/sh
arch-chroot /mnt pacman -S gdm
arch-chroot /mnt systemctl enable gdm.service
