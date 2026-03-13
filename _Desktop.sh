#!/bin/bash

APP_DIR="/usr/share/applications"

TOOLS=(

amass subfinder assetfinder theharvester recon-ng maltego dnsenum dnsrecon fierce spiderfoot
whatweb wafw00f httprobe aquatone eyewitness

burpsuite nikto dirsearch gobuster ffuf wfuzz sqlmap xsser commix wpscan feroxbuster arjun
paramspider dalfox jaeles nuclei hakrawler gospider katana httpx

metasploit searchsploit routersploit crackmapexec impacket empire covenant responder evil-winrm
bloodhound mimikatz powersploit veil shellter

john hashcat hydra medusa ncrack ophcrack patator crowbar brutespray hash-identifier

wifite aircrack-ng reaver bully pixiewps bettercap hcxdumptool hcxtools mdk4 fern-wifi-cracker

ghidra radare2 cutter gdb ltrace strace apktool jadx binwalk volatility

foremost autopsy sleuthkit scalpel bulk-extractor exiftool dc3dd testdisk photorec volatility3

nmap masscan zmap netcat tcpdump wireshark ettercap snmpcheck arp-scan
)

TOTAL=${#TOOLS[@]}
COUNT=0

create_launcher(){

NAME=$1

sudo tee "$APP_DIR/$NAME.desktop" > /dev/null <<EOF
[Desktop Entry]
Name=$NAME
Comment=Ferramenta de segurança do KLAE Linux
Exec=$NAME --help
Icon=$NAME
Terminal=true
Type=Application
Categories=KLAE;Security;
EOF

}

(
for tool in "${TOOLS[@]}"
do

COUNT=$((COUNT+1))
PERCENT=$((COUNT*100/TOTAL))

echo $PERCENT
echo "XXX"
echo "Criando launcher $tool ($COUNT de $TOTAL)"
echo "XXX"

create_launcher "$tool"

done

) | dialog --title "KLAE Linux Desktop Builder" --gauge "Criando atalhos..." 10 70 0

clear

echo "======================================"
echo "Atalhos das ferramentas criados!"
echo "$TOTAL launchers instalados."
echo "======================================"