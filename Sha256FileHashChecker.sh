#!/usr/bin/env bash

echo -n "What is the file name: "
read FILE_LOCATION

echo -n "What is the original file hash (sha256): "
read CHECKSUM

COMPUTED=$(sha256sum $FILE_LOCATION)
COMPUTED=${COMPUTED:0:64}

echo The Computed Hash is: $COMPUTED
echo The Original Hash is: $CHECKSUM

if [[ 0x$COMPUTED -eq 0x$CHECKSUM ]] 
then
    echo "File integrity is okay!"
else
    echo "File integrity is not okay!!!"
fi
