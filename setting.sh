#! /bin/bash
arch-chroot /mnt hostnamectl set-hostname host
arch-chroot /mnt pacman-key --init
arch-chroot /mnt pacman-key --populate archlinux
#arch-chroot /mnt mkinitcpio -p linux
arch-chroot /mnt pacman -Sy
cp ./conf/locale.gen /mnt/etc/
cp ./conf/locale.conf /mnt/etc/
cp ./conf/pacman.conf /mnt/etc/
cp ./conf/vconsole.conf /mnt/etc/
cp ./conf/root/.bashrc /mnt/root/
for USERNAME in /mnt/home/*/ ; do
[ -d "$USERNAME" ] && cp ./conf/users/.bashrc "$USERNAME" || true;
done
arch-chroot /mnt locale-gen
arch-chroot /mnt pacman -Sy
rm /mnt/etc/fstab
genfstab -p /mnt >> /mnt/etc/fstab
./startmenu.sh
