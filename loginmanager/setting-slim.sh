#! /bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "Настройка slim" --clear  \
        --menu "Выберите установленный графический интерфейс" 20 61 5 \
        "xfce" "" \
        "razor-qt" "" \
        "gnome" "" \
        "kde" "" 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
0)
for USERNAME in /mnt/home/*/ ; do
[ -d "$USERNAME" ] && cp ./slim/$choice/.xinitrc "$USERNAME" || true;
done
./loginmanager.sh;;
1)
./startmenu.sh;;
255)
./startmenu.sh;;
esac
