cp ./conf/mirrorlist /etc/pacman.d/mirrorlist.backup
echo Выбор серверов...
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel
cp /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
cp ./conf/mirrorlist /mnt/etc/pacman.d/mirrorlist.backup
./startmenu.sh
