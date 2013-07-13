#! /bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "Установка менеджера входа в систему" --clear  \
        --menu "Выберите действие" 20 61 5 \
        "./loginmanager/slim.sh"					"slim" \
        "./loginmanager/setting-slim.sh"			"Настройка slim" \
        "./loginmanager/lxdm.sh"  					"lxdm" \
        "./loginmanager/gdm.sh"  					"gdm" 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
0)
$choice
./loginmanager.sh;;
1)
./startmenu.sh;;
255)
./startmenu.sh;;
esac
