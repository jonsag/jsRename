#!/bin/bash

# script to rename all spaces, commas and hashtags in files and directories recurcively

REPLACEMENT_CHAR=$1

if [ -z "$REPLACEMENT_CHAR" ]; then
    REPLACEMENT_CHAR="_"
fi

echo "Will replace with the character $REPLACEMENT_CHAR"
echo

SED_STRING='s/[ #,]/'$REPLACEMENT_CHAR'/g'

find . | while read NAME; do
    C=`basename "$NAME"`
    B=`echo ${NAME%$C} | sed "$SED_STRING"`
    rename -v "$SED_STRING" "$B`basename "$NAME"`"
done
