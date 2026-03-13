#!/bin/bash

TOOLS=(

amass subfinder assetfinder theharvester recon-ng maltego dnsenum dnsrecon fierce spiderfoot whatweb wafw00f httprobe aquatone eyewitness

burpsuite nikto dirsearch gobuster ffuf wfuzz sqlmap xsser commix wpscan feroxbuster arjun paramspider dalfox jaeles nuclei hakrawler gospider katana httpx

metasploit searchsploit routersploit crackmapexec impacket empire covenant responder evil-winrm bloodhound mimikatz powersploit veil shellter

john hashcat hydra medusa ncrack ophcrack patator crowbar brutespray hash-identifier

wifite aircrack-ng reaver bully pixiewps bettercap hcxdumptool hcxtools mdk4 fern-wifi-cracker

ghidra radare2 cutter gdb ltrace strace apktool jadx binwalk volatility

foremost autopsy sleuthkit scalpel bulk-extractor exiftool dc3dd testdisk photorec volatility3

nmap masscan zmap netcat tcpdump wireshark-qt ettercap snmpcheck arp-scan
)

TOTAL=${#TOOLS[@]}
COUNT=0

install_tool(){

TOOL=$1

if pacman -Si "$TOOL" &>/dev/null; then

sudo pacman -S --noconfirm "$TOOL"

else

yay -S --noconfirm "$TOOL"

fi

}

(
for tool in "${TOOLS[@]}"
do

COUNT=$((COUNT+1))
PERCENT=$((COUNT*100/TOTAL))

echo $PERCENT
echo "XXX"
echo "Instalando $tool ($COUNT de $TOTAL)"
echo "XXX"

install_tool "$tool"

done

) | dialog --title "KLAE Linux Tool Installer" --gauge "Instalando ferramentas..." 10 70 0

clear

echo "======================================"
echo "Instalação finalizada!"
echo "$TOTAL ferramentas processadas."
echo "======================================"

bash '_Desktop.sh'