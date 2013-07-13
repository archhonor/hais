#! /bin/sh
arch-chroot /mnt pacman -S networkmanager modemmanager dhcpcd iptables dnsmasq bluez openresolv network-manager-applet networkmanager-openconnect networkmanager-openvpn networkmanager-pptp networkmanager-vpnc networkmanager-dispatcher-netfs networkmanager-dispatcher-ntpd networkmanager-dispatcher-sshd
arch-chroot /mnt systemctl enable NetworkManager.service
./networkmanager.sh
