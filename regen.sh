#!/usr/bin/env bash
SDIR=site
BDIR=blog
WDIR=/$BDIR
FDIR=$SDIR/$BDIR
JPEG=".jpeg$"
MD="weblog.md"
ls -ct1 $FDIR >cat
echo "# Web Log" >$MD
while read fn ; do
	date=`./date.sh "$FDIR/$fn"`
	echo "## $date "
	if [[ "$fn" =~ $JPEG ]] ; then
		echo "![$date]($WDIR/$fn)"
	fi
done <cat >>$MD
rm cat
make
