#!/bin/sh

jobargs=$1

dateA=`LANG=C; date "+%a"`
dateHHMM=`LANG=C; date "+%H%M"`

echo "[execsh:jobargs]"${jobargs}

echo "["${dateA}","${dateHHMM}"]"${jobargs}
