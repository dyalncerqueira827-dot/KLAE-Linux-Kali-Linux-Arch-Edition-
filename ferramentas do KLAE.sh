#!/bin/bash

tools=(
nmap
wireshark-qt
metasploit
john
hydra
aircrack-ng
sqlmap
nikto               
hashcat
gobuster
wireshark
dirb
tcpdump
netcat
socat
bettercap
radare2
ghidra
binwalk
foremost
autopsy
volatility
masscan
dnsenum
)

total=${#tools[@]}
count=0

(
for tool in "${tools[@]}"; do
    sudo pacman -S --noconfirm $tool > /dev/null 2>&1

    count=$((count+1))
    percent=$((count*100/total))

    echo $percent
    sleep 0.2
done
) | dialog --title "KLAE Linux Installer" --gauge "Instalando ferramentas..." 10 70 0

clear
echo "✅ Todas as ferramentas foram instaladas!"

bash yay-tools.sh

