#! /bin/sh
arch-chroot /mnt pacman -S grub-bios
arch-chroot /mnt pacman -S grub-efi-x86_64
DIALOG=${DIALOG=Xdialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title "Установка GRUB2" --clear \
 --inputbox "Выребите устройство для установки GRUB2. /dev/..." 16 51 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
  0)
arch-chroot /mnt grub-install /dev/$choice
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg
./startmenu.sh;;
  1)
	./startmenu.sh;;
255)
	./startmenu.sh;;
esac
