#!/usr/bin/env bash
SDIR=site
BDIR=blog
WDIR=/$BDIR
FDIR=$SDIR/$BDIR
JPEG=".jpeg$"
REMD=".md$"
MD="content/weblog.md"
ls -t1 $FDIR >cat
echo "# Web Log" >$MD
while read fn ; do
	date=`./date.sh "$FDIR/$fn"`
	echo "## $date "
	if [[ "$fn" =~ $JPEG ]] ; then
		echo "![$date]($WDIR/$fn)"
	elif [[ "$fn" =~ $REMD ]] ; then
		markdown $FDIR/$fn
	fi
done <cat >>$MD
rm cat
make
