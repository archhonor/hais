#! /bin/sh
cd /hais
DIALOG=${DIALOG=Xdialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --title "HAIS 0.6" --clear  \
        --menu "Выберите действие" 20 61 5 \
        ./gparted.sh  			"Отредактировать разделы" \
        ./mountboot.sh 			"Примонтировать раздел boot" \
        ./mounthome.sh 			"Примонтировать раздел home" \
        ./mountroot.sh 			"Примонтировать раздел root" \
        ./umount.sh 			"Отмонтировать раздел" \
        ./installarch.sh 		"Установка базовой системы" \
        ./user.sh     			"Добавление пользователя" \
        ./passwd.sh     		"Установить пароль суперпользователя" \
        ./setting.sh  			"Настройка" \
        ./install-grub2.sh  	"Установка GRUB 2" \
        ./loginmanager.sh  		"Установка менеджера входа в систему" \
        ./de.sh  				"Установка графического интерфейса" \
        ./video.sh  			"Установка видеодрайвера" \
        ./networkmanager.sh  	"Установка Network Manager" \
        reboot		  			"Перезагрузка" 2> $tempfile 
retval=$?
choice=`cat $tempfile`
case $retval in
0)
$choice;;
1)
echo "Выход";;
255)
echo "Выход";;
esac
#        ./settingpacman.sh 	"Настроить установщик пакетов" \
