#! /bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15

$DIALOG --title "Примонтировать раздел root" --clear \
 --inputbox "Введите устройство (/dev/...)\n для монтирования:" 16 51 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
  0)
mount /dev/$choice /mnt/
./startmenu.sh;;
  1)
	./startmenu.sh;;
255)
	./startmenu.sh;;
esac
