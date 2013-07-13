#! /bin/sh
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "Установка видеодрайвера" --clear  \
        --menu "Выберите действие" 20 61 5 \
        "./video/nvidia.sh"  			"NVIDIA" \
        "./video/ati.sh"  				"ATI" \
        "./video/nouveau.sh"  			"Nouveau, свободный драйвер для карт NVIDIA" \
        "./video/video-intel.sh"  		"Драйвер для Intel i810/i830/i915/945G/G965+" \
        "./video/intel-video-i740.sh"  	"Драйвер для Intel i740" 2> $tempfile  
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
