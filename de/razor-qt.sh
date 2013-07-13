#! /bin/sh
arch-chroot /mnt pacman -S yaourt
arch-chroot /mnt yaourt -S razor-qt
./de.sh
