#! /bin/sh
cd /hais
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "Network Manager" --clear  \
        --menu "Выберите действие" 20 61 5 \
        "./networkmanager-install.sh"  		"Установить Network Manager" \
        "cp -r /etc/NetworkManager /mnt/etc/"		  		"Скопировать настройки интернета с Live в установленную систему." 2> $tempfile 
retval=$?
choice=`cat $tempfile`
case $retval in
0)
$choice;;
1)
./startmenu.sh;;
255)
./startmenu.sh;;
esac
