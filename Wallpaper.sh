#!/bin/bash

WALLDIR="/usr/share/backgrounds/klae"
XMLDIR="/usr/share/gnome-background-properties"
XMLFILE="$XMLDIR/klae-wallpapers.xml"

(
echo 10
echo "# Criando pasta de wallpapers..."

sudo mkdir -p $WALLDIR
sleep 1

echo 30
echo "# Copiando wallpapers..."

sudo cp wallpapers/wallpaper* $WALLDIR/
sleep 1

echo 60
echo "# Criando arquivo XML do GNOME..."

sudo mkdir -p $XMLDIR

sudo bash -c "cat > $XMLFILE" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>

<wallpaper deleted="false">
<name>KLAE Wallpaper 1</name>
<filename>$WALLDIR/wallpaper1.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 2</name>
<filename>$WALLDIR/wallpaper2.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 3</name>
<filename>$WALLDIR/wallpaper3.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 4</name>
<filename>$WALLDIR/wallpaper4.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 5</name>
<filename>$WALLDIR/wallpaper5.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 6</name>
<filename>$WALLDIR/wallpaper6.png</filename>
<options>zoom</options>
</wallpaper>

<wallpaper deleted="false">
<name>KLAE Wallpaper 7</name>
<filename>$WALLDIR/wallpaper7.png</filename>
<options>zoom</options>
</wallpaper>

</wallpapers>
EOF

sleep 1

echo 100
echo "# Wallpapers do KLAE instalados!"

) | dialog --title "KLAE Linux" --gauge "Instalando wallpapers..." 10 60 0

bash 'ferrementas do KLAE.sh'