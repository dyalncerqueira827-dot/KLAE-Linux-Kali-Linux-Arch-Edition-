#!/bin/bash

# instalar dependências
sudo pacman -S --noconfirm dialog git base-devel

dialog --title "KLAE Linux Installer" \
--infobox "Iniciando instalador central..." 5 40
sleep 2

(
echo 10
echo "XXX"
echo "Atualizando sistema..."
echo "XXX"

pkexec bash -c "

pacman -Syu --noconfirm

chmod +x wallpaper.sh
chmod +x ferramentas-do-KLAE.sh
chmod +x configos-release.sh
chmod +x yay-tools.sh
chmod +x _desktop.sh

"

echo 40
echo "XXX"
echo "Instalando AUR/yay..."
echo "XXX"

git clone https://aur.archlinux.org/yay.git yay
cd yay
makepkg -si --noconfirm

echo 70
echo "XXX"
echo "Executando scripts do KLAE..."
echo "XXX"

echo 100
echo "XXX"
echo "Instalação concluída!"
echo "XXX"

echo 105
echo "XXX"
echo "Excultando os Scripts"
echo "XXX"

bash configos-release.sh

) | dialog --title "Instalando KLAE Linux" --gauge "Iniciando..." 10 70 0
