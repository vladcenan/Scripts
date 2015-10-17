#!/bin/bash
# Script name: checkwan.sh

# OK=0
# WARNING=1
# CRITICAL=2
# UNKNOWN=3

FILE=/tmp/checkwan
URL=http://www.whatsmyip.net
#curl -o $FILE $URL > /dev/null 2>&1 
lynx -dump $URL > $FILE

if [ -s $FILE ]
then
#print the 5th and 7th line from the file '5,7'p
sed -n '6,7'p $FILE | awk '{print $5}'
sudo rm $FILE
exit 0 
else
echo "CRITICAL - External IP was not found."
sudo rm $FILE
exit 2
fi
