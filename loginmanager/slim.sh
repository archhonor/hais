#! /bin/sh
arch-chroot /mnt pacman -S slim
arch-chroot /mnt systemctl enable slim.service
