#! /bin/bash
DIALOG=${DIALOG=Xdialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title "Добавление пользователя" --clear \
 --inputbox "Введите имя пользователя:" 16 51 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
  0)
arch-chroot /mnt useradd -m -G users,audio,lp,optical,storage,video,wheel,power -s /bin/bash $choice
arch-chroot /mnt passwd $choice
./startmenu.sh;;
  1)
	./startmenu.sh;;
255)
	./startmenu.sh;;
esac

