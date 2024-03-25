#!/bin/bash

if (($EUID != 0 )); then
	echo "Run this script as root"
	exit
fi

RED='\033[0;31m'

echo -e "${RED}Updating System"
apt update && apt upgrade -y


echo -e "${RED}Adding Kali Repo"
sh -c "echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' > /etc/apt/sources.list.d/kali.list"


echo -e "${RED}Installing gnupg"
apt install -y gnupg

wget 'https://archive.kali.org/archive-key.asc'
apt-key add archive-key.asc

apt update


echo "nearly done"

sh -c "echo 'Package: *'>/etc/apt/preferences.d/kali.pref; echo 'Pin: release a=kali-rolling'>>/etc/apt/preferences.d/kali.pref; echo 'Pin-Priority: 50'>>/etc/apt/preferences.d/kali.pref"


echo "Done"

echo -e "${RED}Check it by installing gobuster and dirsearch"

echo -e "${RED}gobuster: apt install gobuster"
BOLD=$(tput bold)

echo -e "${RED}dirsearch: apt install dirsearch"
