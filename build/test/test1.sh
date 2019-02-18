#!/bin/sh
#< test1.sh - 20190216 - btgchk project
BN=`basename $0`
TMPLOG="tempindex.txt"

TMPEXE="../btgchk"
# seems really just the 'base' path
TMPTER="/media/geoff/backup/next/scenery2"
# TMPTER="/media/geoff/backup/next/scenery2/Terrain"
TMPBUCK="w070n50/w061n53"
TMPTPATH="$TMPTER/Terrain/$TMPBUCK"
TMPAIR="CYYR"
TMPIND="1958866"
TMPBTG="$TMPTPATH/$TMPAIR.btg.gz"

if [ ! -d "$TMPTER" ]; then
    echo "$BN: No such path '$TMPTER"
    exit 1
fi

if [ ! -f "$TMPBTG" ]; then
    echo "$BN: No such file '$TMPBTG"
    exit 1
fi
if [ -f "$TMPLOG" ]; then
    rm -f "$TMPLOG"
fi
# TMPOPT="-a $TMPAIR"
TMPOPT="-i $TMPIND"

echo "$BN: Doing `$TMPEXE -p $TMPTER $TMPOPT` out to $TMPLOG"
echo "$BN: Doing `$TMPEXE -p $TMPTER $TMPOPT`" > $TMPLOG
echo "" >> $TMPLOG

$TMPEXE -p $TMPTER $TMPOPT >> $TMPLOG 2>&1
if [ "$?" = "0" ]; then
    echo "$BN: Done exit(0)"
else
    echo "$BN: non-zero exit($?)"
fi    

#eof

