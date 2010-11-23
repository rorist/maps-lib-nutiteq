#!/bin/sh
# Create the structure for Android device

DST='/home/jbaubort/Desktop/android-sources'

echo -n 'Creating android sources ... '
rm -rf $DST
mkdir -p $DST
mkdir $DST/src
cp -R android/src/* $DST/src/.
cp -R resources/* $DST/src/.
cp -R src/* $DST/src/.
cp -R thirdparty/src/* $DST/src/.
echo 'Finished.'

echo -n 'Clean stuff ... '
rm $DST/src/org/json/util/XML.java
rm $DST/src/org/json/util/XMLTokener.java
rm -rf $DST/src/com/nutiteq/landmark
echo 'Finished.'

exit 0 
