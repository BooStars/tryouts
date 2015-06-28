#!/bin/bash


COLOR="red.png"
COLOR="$1"
if [ ! -f $COLOR ] ; then
	echo "Color not found"
	exit
fi


if [ ! -d icon_src ] ; then
        echo "icon_src not found"
        exit
fi


if [ ! -f icon_src/1080_off.png ] ; then
        echo "Files not found"
        exit
fi

COLOR=$(basename $COLOR .png)
echo $COLOR

if [ ! -d  $COLOR/icon_src ] ; then
        echo "color/icon_src not found"
	mkdir -p $COLOR/icon_src
fi


for ICON in icon_src/*.png
do
echo "----"
echo "convert -gravity center -composite $COLOR.png $ICON $COLOR/$ICON"
convert -gravity center -composite $COLOR.png $ICON $COLOR/$ICON
ICONNEW=$(basename $COLOR/$ICON .png)
ICONNEW=$(echo $ICONNEW | awk -F'_' '{print $1}')
echo "mv $COLOR/$ICON $COLOR/icon_src/$ICONNEW.png"
mv $COLOR/$ICON $COLOR/icon_src/$ICONNEW.png
echo "cp $ICON $COLOR/icon_src"
cp $ICON $COLOR/icon_src
done
