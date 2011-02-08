#!/bin/sh
# Create the structure for Android device

DST='./nutiteq-android'
SRC=`dirname $0`

echo -n 'Creating android sources ... '
rm -rf $DST
mkdir -p $DST
mkdir $DST/src
cp -R $SRC/android/src/* $DST/src/.
cp -R $SRC/resources/* $DST/src/.
cp -R $SRC/src/* $DST/src/.
cp -R $SRC/thirdparty/src/* $DST/src/.
echo 'Finished.'

echo 'Clean stuff ... '

# Unused components
rm $DST/src/org/json/util/XML.java
rm $DST/src/org/json/util/XMLTokener.java
rm -rf $DST/src/com/nutiteq/landmark
#kxml
echo ' - KXML'
rm -rf $DST/src/org/kxml2
mkdir -p $DST/src/org/kxml2/io
cp $SRC/thirdparty/src/org/kxml2/io/KXmlParser.java $DST/src/org/kxml2/io/.
#bluetooth
echo ' - Bluetooth'
rm -rf $DST/src/javax/bluetooth
rm -rf $DST/src/com/nutiteq/bluetooth
rm -rf $DST/src/com/nutiteq/helpers/BluetoothGpsBrowser.java
#motorola
echo ' - Motorola'
rm -rf $DST/src/com/motorola
rm -rf $DST/src/com/nutiteq/fs/IDENFileSystem.java
rm -rf $DST/src/com/nutiteq/fs/MotoFileSystem.java
#images
rm src/images/small_zoom.png \
   src/images/osmico.png \
   src/images/ntico.png\
   src/images/m-l-controlls.png

# Unused maps
echo ' - Unused maps'
rm $DST/src/com/nutiteq/maps/BlomOrthoMap.java
rm $DST/src/com/nutiteq/maps/CloudMade.java
#rm $DST/src/com/nutiteq/maps/GoogleMap.java
rm $DST/src/com/nutiteq/maps/GoogleStaticMap.java
rm $DST/src/com/nutiteq/maps/JaredOpenStreetMap.java
rm $DST/src/com/nutiteq/maps/KaMap.java
rm $DST/src/com/nutiteq/maps/MGMapsMap.java
rm $DST/src/com/nutiteq/maps/NavteqMapTP.java
#rm $DST/src/com/nutiteq/maps/OpenStreetMap.java
rm $DST/src/com/nutiteq/maps/QKMap.java
rm $DST/src/com/nutiteq/maps/Regio.java
rm $DST/src/com/nutiteq/maps/ServerSideServiceRenderedMap.java
rm $DST/src/com/nutiteq/maps/SimpleWMSMap.java
rm $DST/src/com/nutiteq/maps/StreamedCloudMadeMap.java
rm $DST/src/com/nutiteq/maps/StreamedKaMap.java
rm $DST/src/com/nutiteq/maps/StreamedOpenAerialMap.java
rm $DST/src/com/nutiteq/maps/TMSMap.java
rm $DST/src/com/nutiteq/maps/UnstreamedDoubleSizedTilesMap.java
#rm $DST/src/com/nutiteq/maps/UnstreamedMap.java
rm $DST/src/com/nutiteq/maps/MultiStoredMap.java

# Change charset (for patching)
echo ' - Clean charset'
fromdos $DST/src/com/mgmaps/cache/ScreenCache.java
fromdos $DST/src/com/nutiteq/BasicMapComponent.java
fromdos $DST/src/com/mgmaps/utils/Tools.java

echo 'Finished.'

exit 0 
