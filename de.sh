#! /bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "Установка графического интерфейса" --clear  \
        --menu "" 20 61 5 \
        "./de/lxde.sh"  			"LXDE" \
        "./de/xfce4.sh"  			"XFCE 4" \
        "./de/gnome.sh" 	"Gnome" \
        "./de/kde.sh"		"KDE" 2> $tempfile
retval=$?
choice=`cat $tempfile`
case $retval in
0)
$choice
./startmenu.sh;;
1)
./startmenu.sh;;
255)
./startmenu.sh;;
esac
#        "./de/razor-qt.sh"				"Razor-qt" 
